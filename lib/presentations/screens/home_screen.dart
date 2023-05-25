import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/cubit/weather_cubit.dart';

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
      body: BlocConsumer<WeatherCubit, WeatherState>(listener: (ctx, state) {
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
      }, builder: (ctx, state) {
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
          return Center(
            child: Text(state.weather.main),
          );
        }
        return Container();
      }),
    );
  }
}
