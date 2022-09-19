
import 'package:http/http.dart' as http;

import '../Models/WeatherDataModel.dart';


class WeatherApiService {

  Future<WeatherDataModel>? fetchApi()async{


    var client = http.Client();

    String baseURL = "https://weatherbit-v1-mashape.p.rapidapi.com/";

    String query = "forecast/3hourly?lat=35.5&lon=-78.5";

    Map<String,String> header = {
      "X-RapidAPI-Key": "830cb1d0e2msh2bc80e25a0aed3fp1cdf28jsn0a07b0d2bdb1",
      "X-RapidAPI-Host": "weatherbit-v1-mashape.p.rapidapi.com"
    };

    var response  = await client.get(Uri.parse(baseURL+query),headers:header);

    if (response.statusCode == 200){

      WeatherDataModel data = weatherDataModelFromJson(response.body);

      return data;
    }
    else{
      throw Exception("failed to load API");
    }

  }

}
