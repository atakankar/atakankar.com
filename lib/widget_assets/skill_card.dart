import 'package:atakankar/theme/pallete.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String? name;
  final int? level;
  const SkillCard({Key? key, this.name, this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Pallete.defaultAppColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$name".toUpperCase(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
            Row(
              children: [
                for (var i = 1; i <= 5; i++)
                  Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width > 650 ? 5 : 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          i <= level! ? Pallete.defaultAppColor : Colors.grey,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
