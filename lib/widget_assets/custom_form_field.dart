import 'package:atakankar/theme/pallete.dart';
import 'package:flutter/material.dart';

class CustomFromField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomFromField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Pallete.defaultAppColor3),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.only(top: 10),
        prefixIcon: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}
