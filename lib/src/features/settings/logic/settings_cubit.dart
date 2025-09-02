import 'package:do_you_know_hearthstone/src/features/start/logic/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(_SettingsInitial(settings: Settings()));

  void toggleDarkMode() {}
}
