import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_buddy/constants/api_keys.dart';
import 'package:weather_buddy/models/weather_data_model.dart';

class WeatherApiService extends GetxService {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseURL,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "X-RapidAPI-Key": ApiConstants.apiKey,
        "X-RapidAPI-Host": ApiConstants.hostUrl
      },
    ),
  );

  Future<WeatherDataModel> fetchWeatherApi(Position location) async {
    String locationData = "?q=${location.latitude}%2C${location.longitude}";
    //String query = "?q=48.8567%2C2.3508";
    try {
      var response = await client.get(locationData);

      switch (response.statusCode) {
        case 200:
          return WeatherDataModel.fromJson(response.data);
        default:
          throw Exception('error');
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
