import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';
import 'package:weather_buddy/Services/weather_api_services.dart';
import 'package:weather_buddy/controller/location_controller.dart';

class WeatherController extends GetxController {
  WeatherDataModel? weatherData;
  bool isLoading = false;

  String generatedWeatherQuery = Get.find<LocationController>().generateWeatherQuery();
  Future getDataFromAPI() async {
    weatherData = null;
    weatherData = await WeatherApiService().fetchApi(weatherQuery: generatedWeatherQuery)!;
    isLoading = !isLoading;
    log(weatherData.toString());
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataFromAPI();
  }
}
