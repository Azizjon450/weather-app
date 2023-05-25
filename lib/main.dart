import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/logic/repositories/weather_repository.dart';
import 'package:weather_app/logic/services/https/weather_api_services.dart';

import 'presentations/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  void _getWeatherData() async {
    final weatherRepo = WeatherRepository(
      weatherApiServices: WeatherApiServices(
        client: Client(),
      ),
    );
    final weather = await weatherRepo.getWeather('chiroqchi');
    print(weather.temperature);
    print(weather.main);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
