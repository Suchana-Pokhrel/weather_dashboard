import 'package:geolocator/geolocator.dart';
import 'package:weatherapi/core/error/failure.dart';

class LocationService {
  Future<bool> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Failure(errorMessage: 'Location service are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Failure(errorMessage: 'Location service are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Failure(errorMessage: 'Location service are denied forever');
    }
    return await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.low));
  }
}
