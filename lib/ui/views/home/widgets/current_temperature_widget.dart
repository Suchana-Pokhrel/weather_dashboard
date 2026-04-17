import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weatherapi/ui/views/home/viewmodels/home_viewmodel.dart';

class CurrentTemperatureWidget extends StatelessWidget {
  const CurrentTemperatureWidget({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Pulse(
            infinite: true,
            duration: const Duration(seconds: 3),
            child: viewModel.weather?.conditionIcon.isNotEmpty == true
                ? Image.network(
                    viewModel.weather!.conditionIcon,
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.wb_cloudy_outlined,
                      size: 64,
                      color: Colors.white,
                    ),
                  )
                : const Icon(
                    Icons.wb_cloudy_outlined,
                    size: 64,
                    color: Colors.white,
                  ),
          ),
        ),
        Column(
          children: [
            Text(
              "${viewModel.weather?.temperature}°c",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "${viewModel.weather?.condition}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
