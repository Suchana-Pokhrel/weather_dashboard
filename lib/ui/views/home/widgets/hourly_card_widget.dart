import 'package:flutter/material.dart';
import 'package:weatherapi/core/shared/hourly_card_text_widget.dart';
import 'package:weatherapi/ui/views/forecast/models/forecast_model.dart';

class HourlyCardWidget extends StatelessWidget {
  final ForecastModel viewModel;
  const HourlyCardWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final iconUrl = viewModel.conditionIcon.isNotEmpty
        ? 'https:${viewModel.conditionIcon}'
        : null;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      //elevation: 50,
      shadowColor: Colors.black,
      color: isDark
          ? const Color.fromARGB(255, 33, 45, 56)
          : const Color.fromARGB(255, 0, 117, 212),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            HourlyCardTextWidget(
              viewModel: viewModel,
              isDark: isDark,
              text: viewModel.formattedTime,
              color: isDark
                  ? const Color.fromARGB(255, 192, 188, 188)
                  : Colors.white,
              font: 12,
            ),
            if (iconUrl != null)
              Image.network(
                viewModel.conditionIcon,
                width: 60,
                height: 60,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 40,
                ),
              )
            else
              const Icon(
                Icons.cloud,
                color: Colors.white,
                size: 40,
              ),
            HourlyCardTextWidget(
              viewModel: viewModel,
              isDark: isDark,
              font: 12,
              text: '${viewModel.temperature.toString()}°C',
              color: isDark
                  ? const Color.fromARGB(255, 192, 188, 188)
                  : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
