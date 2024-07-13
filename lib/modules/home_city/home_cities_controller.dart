import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/constants/api_response.dart';
import 'package:weather_buddy/models/weather_model.dart';
import 'package:weather_buddy/services/location_services.dart';
import 'package:weather_buddy/services/weather_api_services.dart';

class HomeCityWeatherController extends GetxController {
  late Position position;

  late ApiResponse<WeatherModel> userWeatherData;

  final WeatherApiService _weatherApiService = WeatherApiService();

  Future<void> getDataFromAPI() async {
    userWeatherData = ApiResponse.loading("Loading");
    update();
    try {
      final userLocation = await LocationServices.instance.getUserLocation();

      final WeatherModel weatherApiResponse =
          await _weatherApiService.fetchWeatherApi(userLocation);

      userWeatherData = ApiResponse.completed(weatherApiResponse);
    } catch (e) {
      userWeatherData = ApiResponse.error(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDataFromAPI();
  }
}
