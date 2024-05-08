import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/constants/api_response.dart';
import 'package:weather_buddy/models/weather_data_model.dart';
import 'package:weather_buddy/modules/home_city/home_cities_controller.dart';

class HomeCityScreen extends StatelessWidget {
  const HomeCityScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeCityWeatherController>(
        builder: (weatherController) {
          final ApiResponse<WeatherDataModel> userWeatherData =
              weatherController.userWeatherData;
          switch (userWeatherData.status) {
            case Status.completed:
              return weatherUI(userWeatherData.data!);
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Center(
                child: Text(weatherController.userWeatherData.message!),
              );
          }
        },
      ),
    );
  }
}

Widget weatherUI(WeatherDataModel userWeatherData) {
  final Location locationData = userWeatherData.location!;
  final Current weatherData = userWeatherData.current!;
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Card(
      color: Colors.red,
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.sunny,
                  size: 50,
                ),
                Text("${weatherData.tempC ?? weatherData.feelslikeC}",
                    style: _weatherTextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(locationData.name!,
                        style: _weatherTextStyle(fontSize: 20)),
                    Text("Today", style: _weatherTextStyle(fontSize: 20)),
                  ],
                ),
                const Icon(
                  Icons.wind_power,
                  size: 50,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

TextStyle _weatherTextStyle({int? fontSize}) => TextStyle(
    fontSize: fontSize?.toDouble() ?? 50, fontWeight: FontWeight.bold);
