import 'package:flutter/material.dart';
import 'package:weather_app/presentations/screens/search_screen.dart';
import 'package:weather_app/presentations/screens/settings_screen.dart';

class WeatherMenu extends StatelessWidget {
  final Function getWeather;
  const WeatherMenu({
    super.key,
    required void Function(String city) weatherMenu,
    required this.getWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final _city =
                await Navigator.of(context).pushNamed(SearchScreen.routeName);
            if (_city != null) {
              getWeather(_city as String);
            }
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsScreen.routename);
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
