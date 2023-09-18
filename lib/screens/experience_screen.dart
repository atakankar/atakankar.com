import 'package:atakankar/models/experience_model.dart';
import 'package:flutter/material.dart';

import '../widget_assets/widget_assets.dart';

class ExperienceScreen extends StatefulWidget {
  final List<ExperienceModel> experienceData;
  const ExperienceScreen({Key? key, required this.experienceData})
      : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceData = widget.experienceData;
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
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
                  final index = experienceData.indexOf(experience);
                  bool isFirstItem = index == experienceData.length - 1;
                  bool isLastItem = index == 0;
                  if (experience.isExperience == true) {
                    return ExperienceCard(
                      experience: experience,
                      isLastItem: isLastItem,
                      isFirstItem: isFirstItem,
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
                  final index = experienceData.indexOf(experience);
                  bool isFirstItem = index == experienceData.length - 1;
                  bool isLastItem = index == 0;
                  if (experience.isExperience == false) {
                    return ExperienceCard(
                      experience: experience,
                      isLastItem: isLastItem,
                      isFirstItem: isFirstItem,
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
