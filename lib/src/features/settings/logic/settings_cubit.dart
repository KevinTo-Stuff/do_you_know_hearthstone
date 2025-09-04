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
    final updatedState = state.copyWith(darkMode: darkMode);
    emit(
      _SettingsInitial(
        darkMode: updatedState.darkMode,
        mute: updatedState.mute,
        difficulty: updatedState.difficulty,
        timer: updatedState.timer,
      ),
    );
  }

  void setMute(bool mute) {
    final updatedState = state.copyWith(mute: mute);
    emit(
      _SettingsInitial(
        darkMode: updatedState.darkMode,
        mute: updatedState.mute,
        difficulty: updatedState.difficulty,
        timer: updatedState.timer,
      ),
    );
  }
}
