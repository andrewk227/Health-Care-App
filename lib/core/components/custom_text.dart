import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;
  Color color;
  TextAlign textAlign;
  CustomText(
      {super.key,
      required this.text,
      this.fontSize = 32,
      this.fontWeight = FontWeight.w700,
      this.fontFamily = "DM Sans",
      this.color = Colors.black,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
