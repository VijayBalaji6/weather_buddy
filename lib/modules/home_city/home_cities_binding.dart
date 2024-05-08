import 'package:get/get.dart';
import 'package:weather_buddy/modules/home_city/home_cities_controller.dart';

class HomeCityWeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeCityWeatherController());
  }
}
