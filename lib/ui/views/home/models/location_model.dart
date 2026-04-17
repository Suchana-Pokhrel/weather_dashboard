//search location
class LocationModel {
  final String name;
  final String country;

  LocationModel({
    required this.name,
    required this.country,
  });

  String get displayName => '$name, $country';

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      country: json['country'],
    );
  }

  static List<LocationModel> locationFromJson(List<dynamic> list) {
    return list.map((e) => LocationModel.fromJson(e)).toList();
  }
}
