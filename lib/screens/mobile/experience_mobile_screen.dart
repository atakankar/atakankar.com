import 'package:atakankar/models/experience_model.dart';
import 'package:flutter/material.dart';

import '/../widget_assets/widget_assets.dart';

class ExperienceMobileScreen extends StatefulWidget {
  final List<ExperienceModel> experienceData;
  const ExperienceMobileScreen({Key? key, required this.experienceData})
      : super(key: key);

  @override
  State<ExperienceMobileScreen> createState() => _ExperienceMobileScreenState();
}

class _ExperienceMobileScreenState extends State<ExperienceMobileScreen> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceData = widget.experienceData;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "EXPERIENCE",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Column(
                children: experienceData.map((experience) {
                  if (experience.isExperience == true) {
                    return ExperienceMobileCard(
                      experience: experience,
                    );
                  } else {
                    return const Material();
                  }
                }).toList(),
              ),
              const Text(
                "EDUCATIONS",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Column(
                children: experienceData.map((experience) {
                  if (experience.isExperience == false) {
                    return ExperienceMobileCard(
                      experience: experience,
                    );
                  } else {
                    return const Material();
                  }
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
