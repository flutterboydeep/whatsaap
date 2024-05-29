import 'package:flutter/material.dart';
import 'package:whatsaap/widgets/commonWidget/colors.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  final VoidCallback onPressed;
  final String text;
  final double textfontSize;
  final Color textcolor;
  final FontWeight textfontWeight;

  CustomButton(
      {super.key,
      this.backgroundColor = tabColor,
      this.radius = 12,
      required this.onPressed,
      required this.text,
      this.textfontSize = 18,
      this.textcolor = Colors.white,
      this.textfontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: textcolor,
            fontSize: textfontSize,
            fontWeight: textfontWeight),
      ),
    );
  }
}
