import 'package:atakankar/models/skill_model.dart';
import 'package:flutter/material.dart';

import '/../theme/pallete.dart';
import '/../widget_assets/widget_assets.dart';

class SkillMobileScreen extends StatefulWidget {
  final List<SkillModel> skillDatas;

  const SkillMobileScreen({Key? key, required this.skillDatas})
      : super(key: key);

  @override
  State<SkillMobileScreen> createState() => _SkillMobileScreenState();
}

class _SkillMobileScreenState extends State<SkillMobileScreen> {
  @override
  Widget build(BuildContext context) {
    List<SkillModel> skillData = widget.skillDatas;
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
              const SizedBox(height: 10),
              const Text(
                "SKILLS",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              const Divider(
                //endIndent: 8,
                //indent: 8,
                color: Pallete.defaultAppColor,
                height: 2,
              ),
              const SizedBox(height: 20),
              Center(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 10,
                  children: skillData.map((skill) {
                    return SkillCard(
                      level: skill.level,
                      name: skill.name,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
