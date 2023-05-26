import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentations/witgets/information_weather.dart';

import '../../logic/cubits/cubit/weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeather('Debundsha');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (ctx, state) {
          if (state is WeatherError) {
            showDialog(
              context: context,
              builder: ((ctx) => AlertDialog(
                    title: Text('Error'),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text('OK'),
                      ),
                    ],
                  )),
            );
          }
        },
        builder: (ctx, state) {
          if (state is WeatherInitial) {
            return const Center(
              child: Text('Select a city'),
            );
          }
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoaded) {
            final weather = state.weather;
            final mainWeather = weather.main;
            String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
            String imagePath = '';

            if (mainWeather.contains('rainy')) {
              imagePath = 'assets/images/rainy.jpg';
            } else if (mainWeather.contains('Clear')) {
              imagePath = 'assets/images/sunny.jpg';
            } else if (mainWeather.contains('Clouds')) {
              imagePath = 'assets/images/cloudy.jpg';
            } else {
              imagePath = 'assets/images/night.jpg';
            }

            return Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: 800,
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      elevation: 0,
                    ),
                    InformationWeather(
                        weather: weather, formattedDate: formattedDate)
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
