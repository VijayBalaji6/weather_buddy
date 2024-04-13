import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/models/weather_data_model.dart';
import 'package:weather_buddy/services/weather_api_services.dart';
import 'package:weather_buddy/utils/utils.dart';

class WeatherController extends GetxController {
  LocationPermission? locationPermission;

  late bool isLocationServiceEnabled;

  Position? position;

  late WeatherDataModel? weatherData;

  final WeatherApiService _weatherApiService = WeatherApiService();

  bool isLoading = false;

  Future<void> checkLocationPermission() async {
    bool hasLocServiceOn = await checkLocServiceEnabled();
    if (hasLocServiceOn) {
      locationPermission = await Geolocator.checkPermission();
      checkLocPermissionType();
    }
    update();
  }

void  checkLocPermissionType() {
    switch (locationPermission) {
      case LocationPermission.denied:
        CommonUtils.getSnackBar(
            title: "Location Permission",
            message: "Location Permission denied Forever");
        break;
      case LocationPermission.deniedForever:
        CommonUtils.getSnackBar(
            title: "Location Permission",
            message: "Location Permission denied Forever");
        break;
      case LocationPermission.whileInUse:
        getUserLocation();
        break;
      case LocationPermission.always:
        getUserLocation();
        break;
      case LocationPermission.unableToDetermine:
        CommonUtils.getSnackBar(
            title: "Location Permission",
            message: "Location Permission Unable to determine");
        break;
      default:
        CommonUtils.getSnackBar(
            title: "Location Permission",
            message: "Location Permission Unable to determine");
        break;
    }
  }

  Future requestLocationPermisssion() async {
    return await Geolocator.requestPermission();
  }

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

  Future<void> getDataFromAPI() async {
    Position? location = await getUserLocation();

    if (location != null) {
      weatherData =
          (await _weatherApiService.fetchApi(location)) as WeatherDataModel?;
    } else {
      weatherData = null;
    }

    log(weatherData.toString());
    update();
  }

  @override
  void onInit() {
    checkLocServiceEnabled();
    getDataFromAPI();
    super.onInit();
  }
}
