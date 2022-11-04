import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_buddy/Models/weather_data_model.dart';
import 'package:weather_buddy/Services/weather_api_services.dart';

class WeatherController extends GetxController {
  WeatherDataModel? weatherData;
  bool isLoading = false;

  Future getDataFromAPI() async {
    weatherData = null;
    weatherData = await WeatherApiService().fetchApi()!;
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
