import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/utils/utils.dart';

class LocationController extends GetxController {
  late bool hasLocationPermission;

  LocationPermission? locationPermission;

  Position? position;

  void checkLocationPermission() async {
    hasLocationPermission = await Geolocator.isLocationServiceEnabled();

    if (!hasLocationPermission) {
      CommonUtils.getSnackBar(
          title: "Location Permission", message: "Enable Location Service");
      return Future.error('Location services are disabled.');
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        CommonUtils.getSnackBar(
            title: "Location Permission",
            message: "Location Permission denied");
        return Future.error('Location permissions are denied');
      }
      if (locationPermission == LocationPermission.deniedForever) {
        CommonUtils.getSnackBar(
            title: "Location Permission",
            message: "Location Permission denied Forever");
        return Future.error('Location permissions are denied');
      }
    } else {
      getUserLocation();
    }

    update();
  }

  Future<Position?> getUserLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    log("User location $position");
    return position;
  }

  @override
  void onInit() {
    checkLocationPermission();
    // TODO: implement onInit
    super.onInit();
  }
}
