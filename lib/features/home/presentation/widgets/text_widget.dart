import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.data,
    required this.fontSize,
  });

  final double fontSize;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}