class DailyForecast {
  final String cityName;
  final String dayName;
  final double high;
  final double low;
  final String condition;
  final String conditionIcon;
  final double chanceOfRain;
  final String sunrise;
  final String sunset;

  DailyForecast({
    required this.cityName,
    required this.dayName,
    required this.high,
    required this.low,
    required this.condition,
    required this.conditionIcon,
    required this.chanceOfRain,
    required this.sunrise,
    required this.sunset,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json,
      {String? cityName}) {
    final day = json['day'];
    final conditionDay = day?['condition'];
    final astro = json['astro'];

    return DailyForecast(
      /// [??] returns left hand side if it is not null otherwise right hand side.
      /// ?[] safely access nested maps.
      cityName: cityName ?? json['location']?['name'] ?? "Unknown",
      dayName: _getDayName(json['date'] ?? DateTime.now().toString()),
      // type casting so that app doesnot crash if the API format changes.
      high: (day?['maxtemp_f'] as num?)?.toDouble() ?? 0.0,
      low: (day?['mintemp_f'] as num?)?.toDouble() ?? 0.0,
      condition: conditionDay?['text'] ?? "Unknown",
      conditionIcon: 'https:${conditionDay?['icon'] ?? ''}',
      chanceOfRain: (day?['daily_chance_of_rain'] as num?)?.toDouble() ?? 0.0,
      sunrise: astro?['sunrise'] ?? "",
      sunset: astro?['sunset'] ?? '',
    );
  }

  static List<DailyForecast> listFromJson(List<dynamic> list) {
    return list.map((e) => DailyForecast.fromJson(e)).toList();
  }

  static String _getDayName(String date) {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final parsed = DateTime.parse(date);
    return days[parsed.weekday - 1];
  }
}
