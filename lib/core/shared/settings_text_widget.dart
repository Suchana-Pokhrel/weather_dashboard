import 'package:flutter/material.dart';

class SettingsTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double font;
  final FontWeight fw;
  const SettingsTextWidget({
    super.key,
    required this.text,
    required this.color,
    required this.font,
    required this.fw,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text, //'Settings',
          style: TextStyle(
            color: color, // Colors.white,
            fontSize: font, //25,
            fontWeight: fw, // FontWeight.w700),
          ),
        ));
  }
}
