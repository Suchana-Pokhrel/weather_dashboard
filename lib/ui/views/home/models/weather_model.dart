class WeatherModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final String condition;
  final String conditionIcon;
  final String humidity;
  final double windspeed;
  final double visibility;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.conditionIcon,
    required this.humidity,
    required this.windspeed,
    required this.visibility,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'];
    final location = json['location'];
    // if (location == null) {
    //   print("Warning: The 'location' key is missng");
    // }
    final conditionData = current?['condition'];
    // if (conditionData == null) {
    //   print(
    //       "---------------------------Warning: THE $conditionData key is missng--------------------------------");
    // }
    return WeatherModel(
        cityName: location?['name'] ?? "Unknown Name",
        temperature: current?['temp_c'].toDouble() ?? 0.0,
        feelsLike: current?['feelslike_f'].toDouble() ?? 0.0,
        condition: conditionData?['text'] ?? "Unknown",
        humidity: (current?['humidity'] ?? 0).toString(),
        windspeed: current?['wind_kph'].toDouble() ?? 0.0,
        visibility: (current?['vis_km'] ?? 0.0).toDouble(),
        conditionIcon: 'https:${conditionData?['icon'] ?? ''}');
  }
}
