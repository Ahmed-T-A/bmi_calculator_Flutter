import 'package:flutter/material.dart';

const marginInsets = 15.0;
const borderRadiusNumber = 10.0;

class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final void Function()? onPress;

  const ReusableCard({super.key, this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(marginInsets),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusNumber),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
