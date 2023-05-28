import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/settings/settings_cubit.dart';
import '../../data/models/weather.dart';
import '../../helpers/extensions/string_extensions.dart';

class InformationWeather extends StatefulWidget {
  const InformationWeather({
    super.key,
    required this.weather,
    required this.formattedDate,
  });

  final Weather weather;
  final String formattedDate;

  @override
  State<InformationWeather> createState() => _InformationWeatherState();
}

class _InformationWeatherState extends State<InformationWeather> {
  String _showTemperature(double temp) {
    final tempUnit = context.watch<SettingsCubit>().state.tempUnit;

    if(tempUnit == TempUnits.farenheit) {
      return '${(temp * 9 / 5 + 32).toStringAsFixed(0)}\u2109';
    }else{
      return '${temp.toStringAsFixed(0)}\u2103';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.weather.city.capitalizeString(),
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          widget.formattedDate,
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
          _showTemperature(widget.weather.temperature),
          style: const TextStyle(
            fontSize: 70,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://openweathermap.org/img/wn/${widget.weather.icon}@2x.png'),
            Text(
              widget.weather.main,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          widget.weather.descrip,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}