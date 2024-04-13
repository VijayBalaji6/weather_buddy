import 'package:get/get.dart';

import 'package:weather_buddy/modules/weather/controller/weather_controller.dart';

class WeatherBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => WeatherController());
  }
}