import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BusyWidget extends StatelessWidget {
  final bool isBusy;
  final Widget child;
  const BusyWidget({super.key, required this.isBusy, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isBusy) {
      return Center(
          child: Lottie.asset(
        'assets/flutter_loading_indicator.json',
        height: 50,
        animate: true,
        repeat: true,
      ));
    }
    return child;
  }
}
