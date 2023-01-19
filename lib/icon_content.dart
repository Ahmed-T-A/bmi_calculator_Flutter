import 'package:flutter/material.dart';

const containerLableColor = Color(0xFF8D8E98);
const lableTextStyle = TextStyle(fontSize: 18, color: containerLableColor);
const iconSize = 80.0;

class IconContent extends StatelessWidget {
  final String gender;
  final IconData genderSign;
  IconContent({required this.gender, required this.genderSign});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderSign,
          size: iconSize,
        ),
        SizedBox(height: 15),
        Text(gender, style: lableTextStyle),
      ],
    );
  }
}
