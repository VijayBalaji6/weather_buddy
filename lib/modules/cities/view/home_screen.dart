import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/constants/colors.dart';
import 'package:weather_buddy/models/weather_data_model.dart';
import 'package:weather_buddy/modules/cities/controller/weather_controller.dart';
import 'package:weather_buddy/modules/settings/settings_screen.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({
    super.key,
  });

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final WeatherController _weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Weather Buddy",
        leadIconAction: () {
          Get.to(const SettingsScreen());
        },
        leadIcon: Icons.settings,
        needLeadingIcon: false,
      ),
      backgroundColor: Colors.blue[100],
      body: GetBuilder<WeatherController>(
        builder: (weatherController) {
          if (weatherController.isLocationServiceEnabled == false) {
            return const Center(
              child: Text("Turn on location service"),
            );
          } else if (weatherController.locationPermission ==
                  LocationPermission.deniedForever &&
              weatherController.locationPermission ==
                  LocationPermission.deniedForever &&
              weatherController.locationPermission ==
                  LocationPermission.unableToDetermine) {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    _weatherController.requestLocationPermisssion();
                  },
                  child: const Text("Turn on location service")),
            );
          } else {
            if (_weatherController.weatherData != null) {
              return weatherBuddyUI(_weatherController.weatherData!);
            } else {
              return const SizedBox();
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.cloud),
      ),
    );
  }
}

Column weatherBuddyUI(WeatherDataModel userWeatherData) {
  final locationData = userWeatherData.location;
  final weatherData = userWeatherData.current;
  return Column(children: [
    locationDetails(
        region: locationData!.region!,
        country: locationData.country!,
        area: locationData.name!),
    weatherWidget(
        temp: weatherData!.tempC ?? weatherData.feelslikeC,
        condition: weatherData.condition!.text!),
  ]);
}

Widget locationDetails(
    {required String region, required String area, required String country}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const Icon(
            Icons.location_on,
            size: 20,
            color: AppColor.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Text("$area,"),
          const SizedBox(
            width: 5,
          ),
          Text(region),
        ],
      ),
      Text(country),
    ],
  );
}

Widget weatherWidget({required num? temp, required String condition}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(temp.toString(),
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
      Column(
        children: [
          Icon(
            getConditionIcon(
              condition: condition,
            ),
            size: 20,
          ),
          Text(condition,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      )
    ],
  );
}

IconData getConditionIcon({required String condition}) {
  switch (condition) {
    case "mist":
      return Icons.ac_unit;
    default:
      return Icons.water;
  }
}

Widget windDirectionWidget({required String windDir}) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.north_west),
          Icon(Icons.north),
          Icon(Icons.north_east_rounded),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.west),
          Icon(Icons.ac_unit),
          Icon(Icons.east),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.south_west_rounded),
          Icon(Icons.south),
          Icon(Icons.south_east_rounded),
        ],
      ),
    ],
  );
}
