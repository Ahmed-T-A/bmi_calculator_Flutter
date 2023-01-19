import 'package:flutter/material.dart';

const marginInsets = 15.0;
const borderRadiusNumber = 10.0;

class ReusableCard extends StatelessWidget {
  late final Color colour;
  late final Widget cardChild;

  ReusableCard({required this.colour, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(marginInsets),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusNumber),
        color: colour,
      ),
    );
  }
}
