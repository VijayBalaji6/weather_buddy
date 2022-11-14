import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/utils/utils.dart';

class LocationController extends GetxController {
  bool hasLocationServEnabled = false;

  late final LocationPermission permission;

  late Position position;

  late String long;
  late String lat;

  checkLocServEnable() async {
    hasLocationServEnabled = await Geolocator.isLocationServiceEnabled();

    if (hasLocationServEnabled) {
      log("User has Location is turned on $hasLocationServEnabled");
      CommonUtills.getSnackBar(
          title: "Device Location", message: "Location is turned on");
    } else {
      log("User has Location is turned off $hasLocationServEnabled");
      CommonUtills.getSnackBar(
          title: "Device Location", message: "Location is turned off");
    }

    await requestLocationPermission();

    await getLatLong();
  }



 requestLocationPermission() async {
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        CommonUtills.getSnackBar(
            title: "Location Permission",
            message: "Location Permisson denied forever");
      } else if (permission == LocationPermission.deniedForever) {
        log("'Location permissions are permanently denied");
        CommonUtills.getSnackBar(
            title: "Location Permission",
            message: "Location Permisson denied forever");
      } else {
        log("GPS Location service is granted");
        CommonUtills.getSnackBar(
            title: "Location Permission",
            message: "Location Permisson accessed");
        getLatLong();
      }
    }
    
  else {
  log("GPS Location permission granted.");
  CommonUtills.getSnackBar(
      title: "Location Permission", message: "Location Permisson accessed");
  getLatLong();
}

  }

 getLatLong() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    long = position.longitude.toString();
    lat = position.latitude.toString();

    log("longitude $long");
    log("longitude $lat");

    update();
  }

  String generateWeatherQuery(){
    String generatedWeatherQuery ="?q=$lat%2C$long";
    return generatedWeatherQuery;
  }

  @override
  void onInit() {
    super.onInit();
    checkLocServEnable();
    getLatLong();
  }
}
