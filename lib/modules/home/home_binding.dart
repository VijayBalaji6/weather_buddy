import 'package:get/get.dart';
import 'package:weather_buddy/modules/favourite_cities/favourite_cities_controller.dart';
import 'package:weather_buddy/modules/home/home_controller.dart';
import 'package:weather_buddy/modules/home_city/home_cities_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeCityWeatherController());
    Get.lazyPut(() => FavoriteCitiesWeatherController());
  }
}
