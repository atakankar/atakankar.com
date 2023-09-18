import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final link;
  final image;
  const SocialButton({Key? key, this.link, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 60,
      onPressed: () {
        launch(link);
      },
      child: Image.asset(
        image,
        width: 70,
        height: 70,
      ),
    );
  }
}
