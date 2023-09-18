import 'package:flutter/material.dart';

class InfoTileBuilder extends StatelessWidget {
  final String? value;
  final String? data;
  const InfoTileBuilder({Key? key, this.value, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text("$value:".toUpperCase(),
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        ),
        SizedBox(width: 50),
        Expanded(
          flex: 8,
          child: Text(
            "$data",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
