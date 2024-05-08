import 'package:geolocator/geolocator.dart';

class LocationServices {
  LocationServices._internal();
  static final LocationServices _instance = LocationServices._internal();

  static LocationServices get instance => _instance;

  Future<Position> getUserLocation() async {
    try {
      if (!await _checkIsLocationServicesEnabled()) {
        throw Exception('Location services are disabled.');
      } else {
        if (await _getLocationPermission()) {
          return await Geolocator.getCurrentPosition();
        } else {
          throw Exception(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _checkIsLocationServicesEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<bool> _getLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    try {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
