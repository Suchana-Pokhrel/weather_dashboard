import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherapi/ui/views/home/viewmodels/home_viewmodel.dart';
import 'package:weatherapi/ui/views/home/models/temperature_model.dart';

class TemperatureView extends StatelessWidget {
  final HomeViewModel viewModel;
  const TemperatureView({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Real Time Temperature',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        SfCartesianChart(
          primaryXAxis: const DateTimeAxis(),
          series: <LineSeries<TemperatureModel, DateTime>>[
            LineSeries<TemperatureModel, DateTime>(
              onRendererCreated: (controller) =>
                  viewModel.chartSeriesController = controller,
              dataSource: viewModel.charData,
              xValueMapper: (datum, index) => datum.time,
              yValueMapper: (datum, index) => datum.temp,
              animationDuration: 1000,
            )
          ],
        ),
      ],
    );
  }
}
