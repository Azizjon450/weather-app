import 'package:flutter/material.dart';

import '../../data/models/weather.dart';
import '../../helpers/extensions/string_extensions.dart';

class InformationWeather extends StatelessWidget {
  const InformationWeather({
    super.key,
    required this.weather,
    required this.formattedDate,
  });

  final Weather weather;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          weather.city.capitalizeString(),
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Image.asset( 
          'assets/images/rainpng.png',
          height: 250,
          width: 300,
        ),
        Text(
          '${weather.temperature.toStringAsFixed(0)}\u2103',
          style: const TextStyle(
            fontSize: 70,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
            Text(
              weather.main,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          weather.descrip,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}