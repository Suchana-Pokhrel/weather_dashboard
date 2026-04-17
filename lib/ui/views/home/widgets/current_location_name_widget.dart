import 'package:flutter/material.dart';
import 'package:weatherapi/ui/views/home/viewmodels/home_viewmodel.dart';

class CurrentLocationNameWidget extends StatelessWidget {
  const CurrentLocationNameWidget({
    required this.viewModel,
    super.key,
  });
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Color.fromARGB(255, 171, 169, 169),
          size: 21,
        ),
        Text(
          viewModel.weather?.cityName ?? '',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.9),
        ),
      ],
    );
  }
}
