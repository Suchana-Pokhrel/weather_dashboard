import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:weatherapi/app/app.locator.dart';
import 'package:weatherapi/repository/weather_repository.dart';

class SettingsViewModel extends BaseViewModel {
  final Map<String, dynamic> settings = {
    'weather': false,
    'location': false,
    'theme': false,
  };

  bool getString(String key) => settings[key] ?? "false";

  final repository = locator<WeatherRepository>();

  void toggleTheme(BuildContext context) {
    getThemeManager(context).toggleDarkLightTheme();
    notifyListeners();
  }

  void toggleSwitch(String key) {
    settings[key] = !settings[key];
    notifyListeners();
  }
}
