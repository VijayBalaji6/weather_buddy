import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/utils/utils.dart';

class LocationController extends GetxController {
  late bool isLocationServiceEnabled;

  LocationPermission? locationPermission;

  Position? position;

  Future<bool> checkLocServiceEnabled() async {
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      CommonUtils.getSnackBar(
          title: "Location Permission", message: "Enable Location Service");
      return Future.error('Location services are disabled.');
    } else {
      CommonUtils.getSnackBar(
          title: "Location Permission", message: "Location Service Enabled");
    }
    update();
    return isLocationServiceEnabled;
  }

  Future<void> checkLocationPermission() async {
    bool hasLocServiceOn = await checkLocServiceEnabled();

    if (hasLocServiceOn) {
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
    }
    update();
  }

  Future<Position?> getUserLocation() async {
    if (locationPermission == null) {
      await checkLocationPermission();
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log("User location $position");
      return position;
    }
    return null;
  }

  @override
  void onInit() {
    checkLocServiceEnabled();
    checkLocationPermission();
    // TODO: implement onInit
    super.onInit();
  }
}
