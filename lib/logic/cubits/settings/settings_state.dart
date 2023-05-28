part of 'settings_cubit.dart';
enum TempUnits{celcius, farenheit}

@immutable
class SettingsState {
  final TempUnits? tempUnit;

  SettingsState({this.tempUnit});
} 
