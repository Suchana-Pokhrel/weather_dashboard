import 'package:weatherapi/app/app.locator.dart';
import 'package:weatherapi/core/error/result.dart';
import 'package:weatherapi/ui/views/forecast/models/daily_forecast.dart';
import 'package:weatherapi/ui/views/forecast/models/forecast_model.dart';
import 'package:weatherapi/ui/views/home/models/location_model.dart';
import 'package:weatherapi/ui/views/home/models/temperature_model.dart';
import 'package:weatherapi/ui/views/home/models/weather_model.dart';
import 'package:weatherapi/services/api_service.dart';

class WeatherRepository {
  final apiService = locator<ApiService>();
  String currentLocation = 'Nepal';

  Future<Result<WeatherModel>> getWeather(String location) async {
    try {
      final data = await apiService.getCurrentWeather(location);
      return Result.ok(WeatherModel.fromJson(data));
    } catch (e) {
      return Result.error('Error fetching weather. $e');
    }
  }

  Future<Result<List<ForecastModel>>> getHourlyForecast(String location) async {
    try {
      final data = await apiService.getHourlyForecast(location);
      final forecast = data.map((e) => ForecastModel.fromJson(e)).toList();
      return Result.ok(forecast);
    } catch (e) {
      return Result.error('Error fetching weather. $e');
    }
  }

  Future<Result<List<DailyForecast>>> getDailyForecast(String location) async {
    try {
      final data = await apiService.getDailyForecast(location);
      final String city = data['cityName'];
      final List<dynamic> days = data['forecastDays'];
      final forecast =
          days.map((e) => DailyForecast.fromJson(e, cityName: city)).toList();
      return Result.ok(forecast);
    } catch (e) {
      return Result.error('Error fetching weather. $e');
    }
  }

  Future<Result<List<LocationModel>>> searchLocation(String query) async {
    try {
      final data = await apiService.searchLocation(query);
      final forecast = data.map((e) => LocationModel.fromJson(e)).toList();
      return Result.ok(forecast);
    } catch (e) {
      return Result.error('Error fetching weather. $e');
    }
  }

  Future<TemperatureModel?> fetchLatestReading() async {
    final rawData = await apiService.getLatestTemperature(currentLocation);
    return rawData != null
        ? TemperatureModel(time: DateTime.now(), temp: rawData)
        : null;
  }
}
