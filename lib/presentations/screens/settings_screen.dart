import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/settings/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routename = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListTile(
        title: Text('Temerature Unit'),
        subtitle: const Text('Celcius/ Farenheit (default: Celcius)'),
        trailing: Switch.adaptive(
          value:
              context.watch<SettingsCubit>().state.tempUnit == TempUnits.celcius
                  ? true
                  : false,
          onChanged: ((value) {
            context.read<SettingsCubit>().toggleTemperature();
          }),
        ),
      ),
    );
  }
}
