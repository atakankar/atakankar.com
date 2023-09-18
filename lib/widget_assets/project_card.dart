import 'package:atakankar/models/project_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/pallete.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int _current = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 700 ? 500 : 700,
      height: MediaQuery.of(context).size.width < 700 ? null : 600,
      decoration: BoxDecoration(
          border: Border.all(color: Pallete.defaultAppColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Project Name: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.project.name),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Project Description: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.project.description),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Project Language: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.project.language),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (widget.project.githubLink != "")
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Project Github Link: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'GitHub',
                      style: new TextStyle(color: Colors.blue),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          launch(widget.project.githubLink);
                        },
                    ),
                  ],
                ),
              ),
            if (widget.project.githubLink != "") const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Live on Google Play Store or Apple App Store ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  WidgetSpan(
                    child: Icon(
                        widget.project.status
                            ? Icons.check_circle
                            : Icons.close,
                        color:
                            widget.project.status ? Colors.green : Colors.red,
                        size: 17),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      items: widget.project.imageLinks.map(
                        (link) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: const EdgeInsets.all(10),
                            child: Image.network(
                              link,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          widget.project.imageLinks.asMap().entries.map((e) {
                        return Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == e.key
                                ? Pallete.defaultAppColor.withOpacity(1)
                                : Pallete.defaultAppColor.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                if (_current != 0)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        // Use the controller to change the current page
                        carouselController.previousPage();
                      },
                      color: Pallete.defaultAppColor,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                if (_current != widget.project.imageLinks.length - 1)
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        // Use the controller to change the current page
                        carouselController.nextPage();
                      },
                      color: Pallete.defaultAppColor,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
