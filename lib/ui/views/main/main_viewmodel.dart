import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:weatherapi/ui/views/forecast/forecast_view.dart';
import 'package:weatherapi/ui/views/home/home_view.dart';
import 'package:weatherapi/ui/views/settings/settings_view.dart';

class MainViewModel extends IndexTrackingViewModel {
  List<Widget> get views => const [HomeView(), ForecastView(), SettingsView()];
}
