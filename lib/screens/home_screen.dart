import 'package:atakankar/models/experience_model.dart';
import 'package:atakankar/models/project_model.dart';
import 'package:atakankar/models/skill_model.dart';
import 'package:atakankar/theme/pallete.dart';
import 'package:atakankar/utils/global_variable.dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget_assets/widget_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  var aboutData;
  List<SkillModel> skillDatas = [];
  List<ProjectModel> projectDatas = [];
  List<ExperienceModel> experienceDatas = [];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> fetchData() async {
    ///GET ABOUT DATA
    aboutData = await FirebaseFirestore.instance
        .collection("About")
        .doc(language)
        .get();

    ///GET SKILLS DATA
    try {
      var _skillDatas = await FirebaseFirestore.instance
          .collection("Skills")
          .orderBy("order")
          .get();
      skillDatas = [];
      _skillDatas.docs.forEach((doc) {
        Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        skillDatas.add(SkillModel(
          name: docData['name'] ?? '',
          level: docData['level'] ?? 0,
          order: docData['order'] ?? 0,
        ));
      });
    } catch (e) {
      print(e);
      return false;
    }

    ///GET PROJECTS DATA
    try {
      var _projectDatas = await FirebaseFirestore.instance
          .collection("Projects")
          .orderBy("order")
          .get();
      projectDatas = [];
      _projectDatas.docs.forEach((doc) {
        Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        projectDatas.add(ProjectModel(
          name: docData['name'] ?? '',
          description: docData['description'] ?? '',
          order: docData['order'] ?? 0,
          status: docData['status'] ?? false,
          githubLink: docData['githubLink'] ?? '',
          imageLinks: List<String>.from(docData['imageLinks']),
          language: docData['language'] ?? '',
        ));
      });
    } catch (e) {
      print(e);
      return false;
    }

    ///GET EXPERIENCE AND EDUCATION DATA
    try {
      var _experienceDatas = await FirebaseFirestore.instance
          .collection("ExperienceAndEducations")
          .orderBy("startDateYear", descending: true)
          .orderBy("startDateMonth", descending: true)
          .get();
      experienceDatas = [];
      _experienceDatas.docs.forEach((doc) {
        Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        experienceDatas.add(ExperienceModel(
          List<String>.from(docData['descriptions']),
          docData['finishDateMonth'],
          docData['finishDateYear'],
          name: docData['name'],
          title: docData['title'],
          location: docData['location'],
          isFinish: docData['isFinish'],
          isExperience: docData['isExperience'],
          startDateMonth: docData['startDateMonth'],
          startDateYear: docData['startDateYear'],
        ));
      });
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('NO DATA');
          } else if (snapshot.data == true) {
            final width = MediaQuery.of(context).size.width * 0.43;
            return SelectionArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Pallete.defaultAppColor,
                  title: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(left: width / 4 - 15),
                    child: const Text(
                      "Atakan Kar",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  actions: [
                    if (MediaQuery.of(context).size.width > 700)
                      for (int i = 0; i < navBarButtonText.length; i++)
                        NavButton(
                          onTap: () {
                            scrollControl(globalKeys[i]);
                          },
                          buttonText: navBarButtonText[i],
                        ),
                    if (MediaQuery.of(context).size.width < 700)
                      PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) {
                          return navBarButtonText.map((String option) {
                            final index = navBarButtonText.indexOf(option);
                            return PopupMenuItem<String>(
                              value: index.toString(),
                              child: Text(option),
                            );
                          }).toList();
                        },
                        onSelected: (value) {
                          scrollControl(globalKeys[int.parse(value)]);
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    SizedBox(width: (width / 4) - 15),
                  ],
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: scrollController,
                      child: Center(
                          child: MediaQuery.of(context).size.width > 650
                              ? pages(aboutData, skillDatas, projectDatas,
                                  experienceDatas)
                              : pagesMobile(aboutData, skillDatas, projectDatas,
                                  experienceDatas)),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Text('NO DATA');
          }
        });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

Future scrollControl(keys) async {
  final context = keys.currentContext;
  await Scrollable.ensureVisible(
    context,
    duration: const Duration(milliseconds: 1000),
    curve: Curves.fastOutSlowIn,
  );
}
