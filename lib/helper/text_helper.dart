import 'package:flutter/material.dart';

class TextHelper extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  TextHelper(
      {super.key,
      required this.text,
      this.fontSize = 15,
      this.color = Colors.white,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
