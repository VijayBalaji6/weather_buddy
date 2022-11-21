import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_buddy/controller/weather_controller.dart';
import 'package:weather_buddy/utils/custom_appbar.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController _weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Weather Buddy"),
      body: GetBuilder<WeatherController>(
        builder: (weatherController) {
        if (weatherController.weatherData != null) {
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Text(weatherController.weatherData!.location!.country!
                      .toString()),
                ]);
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
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
