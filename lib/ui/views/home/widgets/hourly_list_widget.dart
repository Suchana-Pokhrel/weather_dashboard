import 'package:flutter/material.dart';
import 'package:weatherapi/ui/views/home/viewmodels/home_viewmodel.dart';
import 'package:weatherapi/ui/views/home/widgets/hourly_card_widget.dart';

class HourlyListWidget extends StatelessWidget {
  const HourlyListWidget({
    required this.viewModel,
    super.key,
  });
  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => HourlyCardWidget(
                viewModel: viewModel.hourlyForecast[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
          itemCount: viewModel.hourlyForecast.length),
    );
  }
}
