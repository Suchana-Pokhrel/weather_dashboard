import 'package:weatherapi/repository/weather_repository.dart';
import 'package:weatherapi/ui/views/home/home_view.dart';
import 'package:weatherapi/ui/views/forecast/forecast_view.dart';
import 'package:weatherapi/ui/views/settings/settings_view.dart';
import 'package:weatherapi/ui/views/startup/startup_view.dart';
import 'package:weatherapi/ui/views/main/main_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weatherapi/services/api_service.dart';
import 'package:weatherapi/services/location_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: MainView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ForecastView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: WeatherRepository),
// @stacked-service
  ],
)
class App {}
