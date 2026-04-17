import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:weatherapi/app/app.locator.dart';
import 'package:weatherapi/core/error/result.dart';
import 'package:weatherapi/ui/views/forecast/models/daily_forecast.dart';
import 'package:weatherapi/repository/weather_repository.dart';

class ForecastViewModel extends BaseViewModel {
  final _repository = locator<WeatherRepository>();

  List<DailyForecast> _dailyForecast = [];

  List<DailyForecast> get forecast => _dailyForecast;

  void toggleTheme(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme();
    notifyListeners();
  }

  Future<void> loadForecast() async {
    setBusy(true);
    final result =
        await _repository.getDailyForecast(_repository.currentLocation);
    switch (result) {
      case Ok(value: var data):
        _dailyForecast = data;
        setError(null);
      case Error(error: var error):
        _dailyForecast = [];
        setError(error);
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> onForecastRefresh() async {
    await loadForecast();
  }
}
