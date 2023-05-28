import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/settings/settings_cubit.dart';
import 'package:weather_app/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_app/logic/repositories/weather_repository.dart';
import 'package:weather_app/logic/services/https/weather_api_services.dart';
import 'package:weather_app/presentations/screens/search_screen.dart';
import 'package:weather_app/presentations/screens/settings_screen.dart';

import 'presentations/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _getWeatherData() async {}

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(
          client: Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) => WeatherCubit(
                  weatherRepository: context.read<WeatherRepository>(),
                )),
          ),
          BlocProvider(
            create: ((context) => SettingsCubit()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            ),
            home: HomeScreen(),
            routes: {
              SearchScreen.routeName: (ctx) => SearchScreen(),
              SettingsScreen.routename: (ctx) => const SettingsScreen(),
            }),
      ),
    );
  }
}
