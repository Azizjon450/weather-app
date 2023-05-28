import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(tempUnit: TempUnits.celcius));

  void toggleTemperature() {
    if(state.tempUnit == TempUnits.celcius) {
      emit(SettingsState(tempUnit: TempUnits.farenheit));
    }else{
      emit(SettingsState(tempUnit: TempUnits.celcius));
    }
  }
}
