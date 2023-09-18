import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 18,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < socialIcons.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          launchUrlString(socialLinks[i]);
                        },
                        icon: Icon(socialIcons[i]),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              child: Text("© Develped By Atakan Kar with Flutter",
                  style: TextStyle(
                      fontFamily: "inherit",
                      fontSize: width < 380 ? 14 : 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45)),
            ),
            SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}

List<IconData> socialIcons = <IconData>[
  FontAwesomeIcons.linkedinIn,
  FontAwesomeIcons.github,
  FontAwesomeIcons.discord
];

List<String> socialLinks = <String>[
  "https://www.linkedin.com/in/atakan-kar",
  "https://github.com/atakankar",
  "https://discordapp.com/users/402485716061257728"
];
