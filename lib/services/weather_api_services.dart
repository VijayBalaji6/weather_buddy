import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_buddy/constants/api_keys.dart';
import 'package:weather_buddy/models/current_weather.dart';
import 'package:weather_buddy/models/location.dart';

class WeatherApiService extends GetxService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseURL,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  Future<CurrentWeather> fetchWeatherApi(Position location) async {
    try {
      Response response = await dio.get(ApiConstants.currentUrl,
          queryParameters: {
            'key': ApiConstants.apiKey,
            'q': '${location.latitude},${location.longitude}'
          });

      switch (response.statusCode) {
        case 200:
          return CurrentWeather.fromJson(response.data);
        default:
          throw Exception('error');
      }
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<City> fetchCitiesApi(String name) async {
    try {
      Response response = await dio.get(ApiConstants.currentUrl,
          queryParameters: {'key': ApiConstants.apiKey, 'q': name});

      switch (response.statusCode) {
        case 200:
          return City.fromJson(response.data);
        default:
          throw Exception('error');
      }
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
