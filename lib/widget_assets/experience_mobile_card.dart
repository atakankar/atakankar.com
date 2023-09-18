import 'package:atakankar/models/experience_model.dart';
import 'package:flutter/material.dart';

import '../theme/pallete.dart';

class ExperienceMobileCard extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceMobileCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Pallete.defaultAppColor2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.name.toUpperCase(),
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              experience.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(
              "${experience.startDateMonth}/${experience.startDateYear} - ${experience.finishDateMonth}/${experience.finishDateYear}",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              experience.location,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            const Divider(
              height: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            for (int i = 0; i < experience.descriptions.length; i++)
              if (experience.descriptions[i] != "")
                Column(
                  children: [
                    Text(
                      "• ${experience.descriptions[i]}",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
