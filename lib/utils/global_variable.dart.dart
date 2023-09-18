import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/experience_screen.dart';
import '../screens/footer_screen.dart';
import '../screens/mobile/about_mobile_screen.dart';
import '../screens/mobile/contact_mobile_screen.dart';
import '../screens/mobile/experience_mobile_screen.dart';
import '../screens/mobile/portfolio_mobile_screen.dart';
import '../screens/mobile/skill_mobile_screen.dart';
import '../screens/portfolio_screen.dart';
import '../screens/skill_screen.dart';

String language = "En";

final homeKeys = GlobalKey();
final aboutKeys = GlobalKey();
final skillsKeys = GlobalKey();
final contactKeys = GlobalKey();
final exprienceKeys = GlobalKey();
final portFolioKeys = GlobalKey();

List<String> navBarButtonText = [
  "About",
  "Skills",
  "Portfolio",
  "Experience",
  "Contact"
];
List<GlobalKey> globalKeys = <GlobalKey>[
  aboutKeys,
  skillsKeys,
  portFolioKeys,
  exprienceKeys,
  contactKeys
];

List<String> aboutValues = [
  "birthday",
  "email",
  "phone",
  "address",
  "language"
];
Column pages(aboutData, skillData, projectData, experienceData) {
  return Column(
    children: [
      Container(
          key: aboutKeys,
          child: AboutScreen(
            aboutData: aboutData,
          )),
      Container(
          key: skillsKeys,
          child: SkillScreen(
            skillDatas: skillData,
          )),
      Container(
          key: portFolioKeys,
          child: PortfolioScreen(
            projectData: projectData,
          )),
      Container(
          key: exprienceKeys,
          child: ExperienceScreen(
            experienceData: experienceData,
          )),
      Container(
        key: contactKeys,
        child: ContactScreen(),
      ),
      Container(child: const FooterScreen())
    ],
  );
}

Column pagesMobile(aboutData, skillData, projectData, experienceData) {
  return Column(
    children: [
      Container(
          key: aboutKeys,
          child: AboutMobileScreen(
            aboutData: aboutData,
          )),
      Container(
          key: skillsKeys,
          child: SkillMobileScreen(
            skillDatas: skillData,
          )),
      Container(
          key: portFolioKeys,
          child: PortfolioMobileScreen(
            projectData: projectData,
          )),
      Container(
          key: exprienceKeys,
          child: ExperienceMobileScreen(
            experienceData: experienceData,
          )),
      Container(
        key: contactKeys,
        child: ContactMobileScreen(),
      ),
      Container(child: const FooterScreen())
    ],
  );
}
