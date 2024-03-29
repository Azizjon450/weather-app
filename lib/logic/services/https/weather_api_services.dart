import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/constants/constants.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/logic/services/exeptions/weather_exeptions.dart';

class WeatherApiServices {
  final http.Client client;

  WeatherApiServices({required this.client});
  Future<Weather> getWeather(String city) async {
    final url = Uri.parse(
        '$base_url?q=${city.toLowerCase()}&units=metric&appid=$api_key');

    try {
      final response = await client.get(url);
      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }
      final responseBody = jsonDecode(response.body);
      if (responseBody == null) {
        throw WeatherExeptions('Cannot get weather for $city');
      }
      final data = responseBody as Map<String, dynamic>;
      final weatherdata = data['weather'][0];
      final mainData = data['main'];

      final Weather weather = Weather(
        id: weatherdata['id'].toString(),
        main: weatherdata['main'],
        descrip: weatherdata['description'],
        icon: weatherdata['icon'],
        temperature: double.parse(mainData['temp'].toString()),
        city: city,
        time: DateTime.now(),
      );
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
