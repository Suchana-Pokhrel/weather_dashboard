import 'package:flutter/material.dart';
import 'package:weatherapi/ui/views/home/viewmodels/home_viewmodel.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //-------HUMIDITY------------//
        Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: isDark
              ? const Color.fromARGB(255, 33, 45, 56)
              : const Color.fromARGB(255, 0, 117, 212),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 13, 10, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    color: isDark
                        ? const Color.fromARGB(255, 142, 184, 255)
                        : const Color.fromARGB(255, 165, 198, 255),
                    size: 25,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Humidity',
                    style: TextStyle(
                        color: isDark
                            ? const Color.fromARGB(255, 192, 188, 188)
                            : Colors.white,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${viewModel.weather?.humidity}%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        //-------WIND------//
        Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: isDark
              ? const Color.fromARGB(255, 33, 45, 56)
              : const Color.fromARGB(255, 0, 117, 212),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 13, 10, 0),
              child: Column(
                children: [
                  const Icon(
                    Icons.wind_power_sharp,
                    color: Color.fromARGB(255, 40, 255, 248),
                    size: 25,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Wind Speed',
                    style: TextStyle(
                        color: isDark
                            ? const Color.fromARGB(255, 192, 188, 188)
                            : Colors.white,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${viewModel.weather?.windspeed}kph',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        //--------VISIBILTY--------//
        Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: isDark
              ? const Color.fromARGB(255, 33, 45, 56)
              : const Color.fromARGB(255, 0, 117, 212),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 13, 10, 0),
              child: Column(
                children: [
                  const Icon(
                    Icons.visibility_outlined,
                    color: Color.fromARGB(255, 229, 168, 247),
                    size: 25,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Visibility',
                    style: TextStyle(
                        color: isDark
                            ? const Color.fromARGB(255, 192, 188, 188)
                            : Colors.white,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${viewModel.weather?.visibility}km',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
