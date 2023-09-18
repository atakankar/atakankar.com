import 'package:atakankar/models/experience_model.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../theme/pallete.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;
  final bool isLastItem;
  final bool isFirstItem;
  const ExperienceCard(
      {Key? key,
      required this.experience,
      required this.isLastItem,
      required this.isFirstItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      startChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${experience.startDateMonth}/${experience.startDateYear} - ${experience.finishDateMonth}/${experience.finishDateYear}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                experience.location,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 40.0),
        child: Bubble(
            radius: Radius.zero,
            nip: BubbleNip.leftCenter,
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    )
              ],
            )),
      ),
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isLast: isFirstItem,
      isFirst: isLastItem,
      beforeLineStyle: const LineStyle(
        color: Pallete.defaultAppColor,
        thickness: 6,
      ),
      indicatorStyle: const IndicatorStyle(
        width: 20,
        color: Pallete.defaultAppColor,
      ),
    );
  }
}
