import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:weatherapi/app/app.locator.dart';
import 'package:weatherapi/core/error/result.dart';
import 'package:weatherapi/ui/views/forecast/models/forecast_model.dart';
import 'package:weatherapi/ui/views/home/models/location_model.dart';
import 'package:weatherapi/ui/views/home/models/temperature_model.dart';
import 'package:weatherapi/ui/views/home/models/weather_model.dart';
import 'package:weatherapi/repository/weather_repository.dart';
import 'package:weatherapi/services/location_service.dart';
import 'package:weatherapi/ui/views/home/home_view.form.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeViewModel extends FormViewModel with $HomeView {
  final repository = locator<WeatherRepository>();
  final locationService = locator<LocationService>();

  WeatherModel? weather;
  WeatherModel? get weatherHome => weather;

  List<ForecastModel> hourlyForecast = [];
  List<ForecastModel> get hourly => hourlyForecast;

  List<LocationModel> searchResults = [];
  List<LocationModel> get suggestions => searchResults;

  String currentLocation = '';
  String get current => currentLocation;

  List<TemperatureModel> charData = [];
  List<TemperatureModel> get tempData => charData;

  ChartSeriesController? chartSeriesController;
  Timer? timer;

  void toggleTheme(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme();
    notifyListeners();
  }

  void initialiseTemp() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) => updateData());
  }

  Future<void> updateData() async {
    final newTemp = await repository.fetchLatestReading();
    if (newTemp != null) {
      charData.add(newTemp);
      if (charData.length > 15) charData.removeAt(0);

      chartSeriesController?.updateDataSource(
        addedDataIndexes: [charData.length - 1],
        removedDataIndexes: charData.length > 15 ? [0] : [],
      );
      notifyListeners();
    }
  }

  Future<void> initialize() async {
    final hasPermission = await locationService.checkPermission();
    if (hasPermission) {
      final position = await locationService.getCurrentLocation();
      currentLocation = '${position!.latitude},${position.longitude}';
    } else {
      final setPosition = await locationService.requestPermission();
      if (setPosition) {
        final position = await locationService.getCurrentLocation();
        currentLocation = '${position!.latitude},${position.longitude}';
      }

      currentLocation = 'Nepal';
    }

    /// waits for multiple futures to complete and collects their results.
    await Future.wait([
      fetchWeather(currentLocation),
      fetchForecast(currentLocation),
    ]);
    initialiseTemp();
    setBusy(false);
  }

  Future<void> fetchWeather(String location) async {
    setBusy(true);
    final result = await repository.getWeather(location);
    switch (result) {
      case Ok<WeatherModel>():
        weather = result.value;
      case Error():
        setError(result.error);
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> fetchForecast(String location) async {
    setBusy(true);
    final result = await repository.getHourlyForecast(location);
    switch (result) {
      case Ok<List<ForecastModel>>():
        hourlyForecast = result.value;
      case Error():
        setError(result.error);
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> onLocationSelected(String location) async {
    currentLocation = location;
    repository.currentLocation = location;
    searchResults = [];
    searchController.clear();
    await Future.wait([
      fetchWeather(location),
      fetchForecast(location),
    ]);
  }

  Future<void> onClear(String location) async {
    searchController.clear();
    await fetchWeather(location);
  }

  Future<void> onRefresh() async {
    await Future.wait([
      fetchWeather(currentLocation),
      fetchForecast(currentLocation),
    ]);
  }
}
