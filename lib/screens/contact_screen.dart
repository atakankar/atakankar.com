import 'package:atakankar/theme/pallete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget_assets/widget_assets.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController massageController = TextEditingController();

  List<String> hintText = <String>["Name", "Subject", "Email"];
  List<IconData> icon = <IconData>[Icons.person, Icons.note, Icons.email];

  bool isSending = false;

  void sendMassage() async {
    setState(() {
      isSending = true;
    });

    try {
      await FirebaseFirestore.instance.collection("Contact").add({
        "name": nameController.text,
        "subject": subjectController.text,
        "email": emailController.text,
        "massage": massageController.text,
        "date": DateTime.now(),
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      emailController.text = "";
      nameController.text = "";
      subjectController.text = "";
      massageController.text = "";
    });
    setState(() {
      isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/contact.png"), fit: BoxFit.cover),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: !isSending
            ? Card(
                elevation: 10,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Me",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < hintText.length; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: CustomFromField(
                                    controller: hintText[i] == "Name"
                                        ? nameController
                                        : hintText[i] == "Email"
                                            ? emailController
                                            : subjectController,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Do not leave blank';
                                      } else if (val.length > 100) {
                                        return 'Entered text is too long';
                                      } else if (val.isValidName &&
                                          hintText[i] == "Name") {
                                        return 'Enter valid Name';
                                      } else if (!val.isValidEmail &&
                                          hintText[i] == "Email") {
                                        return 'Enter valid email';
                                      } else {
                                        return null;
                                      }
                                    },
                                    hintText: hintText[i],
                                    icon: icon[i],
                                  ),
                                ),
                              Container(
                                width: width,
                                child: TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Do not leave blank';
                                    } else if (val.length > 1024) {
                                      return 'Entered text is too long';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: massageController,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    hintText: "Write your massage....",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.teal),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              SizedBox(
                                width: 80,
                                height: 40,
                                child: ElevatedButton(
                                  style: buttonStyle(),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      sendMassage();
                                    }
                                  },
                                  child: Text("Send"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Pallete.defaultAppColor,
                ),
              ),
      ),
    );
  }
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Pallete.defaultAppColor3),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      )));
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }
}
