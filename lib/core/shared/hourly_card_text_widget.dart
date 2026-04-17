import 'package:flutter/material.dart';
import 'package:weatherapi/ui/views/forecast/models/forecast_model.dart';

class HourlyCardTextWidget extends StatelessWidget {
  const HourlyCardTextWidget({
    super.key,
    required this.viewModel,
    required this.isDark,
    required this.font,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  final double font;
  final ForecastModel viewModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: font),
    );
  }
}
