import 'package:atakankar/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/pallete.dart';
import '../widget_assets/widget_assets.dart';

class PortfolioScreen extends StatefulWidget {
  final List<ProjectModel> projectData;

  const PortfolioScreen({Key? key, required this.projectData})
      : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    List<ProjectModel> projectData = widget.projectData;
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
              const SizedBox(height: 10),
              Text(
                "PORTFOLIO",
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
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: projectData.map((project) {
                    return ProjectCard(project: project);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    launch('https://github.com/atakankar');
                  },
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("For More Project ->"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
