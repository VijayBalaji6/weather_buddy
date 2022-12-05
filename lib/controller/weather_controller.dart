import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';
import 'package:weather_buddy/Services/weather_api_services.dart';
import 'package:weather_buddy/controller/location_controller.dart';

class WeatherController extends GetxController {
  WeatherDataModel? weatherData;
  bool isLoading = false;
  final LocationController _locationController = Get.find<LocationController>();

  Future getDataFromAPI() async {
    Position? location =  await _locationController.getUserLocation();
    weatherData = await WeatherApiService().fetchApi(location!)!;
    isLoading = !isLoading;
    log(weatherData.toString());
    update();
  }

  @override
  void onInit() {
    getDataFromAPI();
    super.onInit();
  }
}
