// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
    : super(
        _SettingsInitial(
          darkMode: false,
          mute: false,
          difficulty: 'Normal',
          timer: 0,
        ),
      );

  void setDarkMode(bool darkMode) {
    emit(
      _SettingsInitial(
        darkMode: darkMode,
        mute: false,
        difficulty: 'Normal',
        timer: 0,
      ),
    );
  }
}
