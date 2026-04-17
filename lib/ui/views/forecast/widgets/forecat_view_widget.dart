import 'package:flutter/material.dart';
import 'package:weatherapi/ui/views/forecast/models/daily_forecast.dart';
import 'package:weatherapi/ui/views/forecast/viewmodels/forecast_viewmodel.dart';

class ForecatViewWidget extends StatelessWidget {
  const ForecatViewWidget({
    super.key,
    required this.isDark,
    required this.viewModel,
  });

  final bool isDark;
  final ForecastViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
        final day = viewModel.forecast[index];
        return Container(
            decoration: BoxDecoration(
                color: isDark
                    ? const Color.fromARGB(255, 33, 45, 56)
                    : const Color.fromARGB(255, 0, 117, 212),
                borderRadius: BorderRadius.circular(10)),
            child: ExpansionTile(
              shape: const Border(),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              leading: _listText(
                  day, day.dayName, Colors.white, 14, FontWeight.w800),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  day.conditionIcon.isNotEmpty
                      ? Image.network(
                          day.conditionIcon,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.cloud_circle,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                  _listText(
                      day, day.condition, Colors.white, 10, FontWeight.normal)
                ],
              ),
              trailing: _listText(day, '${day.chanceOfRain}%', Colors.white, 10,
                  FontWeight.normal),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _detailColumn("Sunrise", day.sunrise),
                    _detailColumn("Sunset", day.sunset),
                    _detailColumn("Low", day.low.toString()),
                    _detailColumn("High", day.high.toString()),
                  ],
                )
              ],
            ));
      },
      itemCount: viewModel.forecast.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
    ));
  }

  Text _listText(
      DailyForecast day, String text, Color color, double font, FontWeight fw) {
    return Text(text, //day.dayName,
        style: TextStyle(
            color: color, //Colors.white,
            fontSize: font, //
            fontWeight: fw) // FontWeight.w800),
        );
  }

  Widget _detailColumn(String label, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 15),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
