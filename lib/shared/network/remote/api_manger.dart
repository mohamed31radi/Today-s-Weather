import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_to_day/shared/constant/constant.dart';

import '../../../models/weather_response.dart';

class APIManger {
  static Future<WeatherResponse> getCurrentWeather(
      double lat, double lon) async {
    var response = await http.get(Uri.parse(
        "https://${ConstantApp.BASEURL}weather?lat=$lat&lon=$lon&appid=${ConstantApp.APIKEY}"));
    var weatherResponse = WeatherResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return weatherResponse;
    } else {
      throw Exception('Failed to load Current Weather Data');
    }
  }
}
