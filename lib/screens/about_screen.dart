import 'package:atakankar/utils/global_variable.dart.dart';
import 'package:flutter/material.dart';

import '../widget_assets/widget_assets.dart';

class AboutScreen extends StatefulWidget {
  final aboutData;
  const AboutScreen({Key? key, this.aboutData}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String aboutDes = "";

  @override
  Widget build(BuildContext context) {
    var aboutData = widget.aboutData;
    aboutDes = aboutData["Description"].replaceAll(r'\n', '\n');
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                aboutData['profilePhotoLink'],
              ),
              radius: 100,
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ABOUT",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          aboutDes,
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.width < 650 ? 450 : 320,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Personal Information:",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        for (int i = 0; i < aboutValues.length; i++)
                          InfoTileBuilder(
                            value: aboutValues[i],
                            data: aboutData[aboutValues[i]],
                          ),
                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialButton(
                  image: 'assets/github.png',
                  link: 'https://github.com/atakankar',
                ),
                SizedBox(width: 20),
                SocialButton(
                  image: 'assets/linkedin.png',
                  link: 'https://www.linkedin.com/in/atakan-kar',
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
