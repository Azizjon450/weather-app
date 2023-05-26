import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../helpers/extensions/string_extensions.dart';
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
    context.read<WeatherCubit>().getWeather('london');
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
            String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
            return Stack(
              children: [
                Image.asset(
                  'assets/images/rainy.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: 800,
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                ),
                // AppBar(
                //   backgroundColor: Colors.transparent,
                //   leading: IconButton(
                //       onPressed: () {}, icon: const Icon(Icons.search),),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          weather.city.capitalizeString(),
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
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
                        Text(
                          weather.main,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
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
