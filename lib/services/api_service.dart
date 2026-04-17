import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapi/core/error/failure.dart';

const String _baseUrl = 'https://api.weatherapi.com/v1/';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters
            .addAll({'key': dotenv.env["API_KEY"] ?? 'default_value'});
        handler.next(options);
      },
    ));
  }

  Future<Map<String, dynamic>> fetchForecast(String location) async {
    try {
      final response = await dio.get('forecast.json', queryParameters: {
        'q': location,
        'days': 7,
        'aqi': 'no',
      });
      return response.data;
    } on DioException catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure(errorMessage: 'Error fetching forecast: $e');
    }
  }

  // returns current weather block
  Future<Map<String, dynamic>> getCurrentWeather(String location) async {
    final data = await fetchForecast(location);
    return data;
  }

  // returns today's 24 hourly items
  Future<List<dynamic>> getHourlyForecast(String location) async {
    final data = await fetchForecast(location);
    return data['forecast']['forecastday'][0]['hour'];
  }

  // returns 7 day forecast
  Future<Map<String, dynamic>> getDailyForecast(String location) async {
    if (location.isEmpty) return {};
    final data = await fetchForecast(location);
    return {
      'cityName': data['location']?['name'] ?? 'Unknown',
      'forecastDays': data['forecast']['forecastday'],
    };
  }

  // search locations for search bar
  Future<List<dynamic>> searchLocation(String query) async {
    try {
      final response = await dio.get('search.json', queryParameters: {
        'q': query,
      });
      return response.data;
    } on DioException catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure(errorMessage: 'Error searching location: $e');
    }
  }

  Future<double?> getLatestTemperature(String location) async {
    try {
      final response = await dio.get('forecast.json', queryParameters: {
        'key': dotenv.env["API_KEY"] ?? 'default_value',
        'q': location
      });
      if (response.statusCode == 200) {
        return response.data['current']['temp_c'].toDouble();
      }
    } on DioException catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure(errorMessage: 'Error fetching current weather: $e');
    }
    return null;
  }
}
