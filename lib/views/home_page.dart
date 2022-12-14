import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_buddy/constants/theming.dart';
import 'package:weather_buddy/controller/weather_controller.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';
import 'package:weather_buddy/views/settings.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController _weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          title: "Weather Buddy",
          leadIconAction: () {
            Get.to(const Settings());
          },
          leadIcon: Icons.settings),
      backgroundColor: Colors.blue[100],
      body: GetBuilder<WeatherController>(builder: (weatherController) {
        if (weatherController.weatherData != null) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                var locationData = weatherController.weatherData!.location!;
                var weatherData = weatherController.weatherData!.current!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    locationDetails(
                        region: locationData.region!,
                        country: locationData.country!,
                        area: locationData.name!),
                    weatherWidget(
                        temp: weatherData.tempC ?? weatherData.feelslikeC,
                        condition: weatherData.condition!.text!),
                  ]),
                );
              });
        } else {
          return Center(
            child: Lottie.asset("assets/animations/weather_loading.json"),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _weatherController.getDataFromAPI();
        },
        child: const Icon(Icons.cloud),
      ),
    );
  }
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
            color: constBlack,
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.north_west),
          Icon(Icons.north),
          Icon(Icons.north_east_rounded),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.west),
          Icon(Icons.ac_unit),
          Icon(Icons.east),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.south_west_rounded),
          Icon(Icons.south),
          Icon(Icons.south_east_rounded),
        ],
      ),
    ],
  );
}
