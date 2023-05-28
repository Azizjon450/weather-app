import 'package:flutter/material.dart';

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
          value: true,
          onChanged: ((value) {}),
        ),
      ),
    );
  }
}
