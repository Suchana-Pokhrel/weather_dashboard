import 'package:flutter/material.dart';

class HourlyAlignWidget extends StatelessWidget {
  const HourlyAlignWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Hourly Forecast',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
