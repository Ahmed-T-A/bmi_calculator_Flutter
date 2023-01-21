import 'package:flutter/material.dart';
import 'constatnts.dart';

class IconContent extends StatelessWidget {
  final String gender;
  final IconData genderSign;
  final Color iconColor;
  IconContent(
      {required this.gender,
      required this.genderSign,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderSign,
          size: kIconSize,
          color: iconColor,
        ),
        SizedBox(height: 15),
        Text(gender, style: kLableTextStyle),
      ],
    );
  }
}
