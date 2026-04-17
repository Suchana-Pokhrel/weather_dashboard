class ForecastModel {
  final String time;
  final double temperature;
  final String condition;
  final String conditionIcon;

  ForecastModel({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.conditionIcon,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    final conditionData = json['condition'];
    return ForecastModel(
        time: json['time'],
        temperature: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
        condition: conditionData?['text'] ?? "Unknown",
        conditionIcon: 'https:${conditionData?['icon'] ?? ''}');
  }

  String get formattedTime {
    if (time.isEmpty) return "";
    final dateTime = DateTime.parse(time);
    final hour = dateTime.hour;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return "$displayHour $period";
  }
}
