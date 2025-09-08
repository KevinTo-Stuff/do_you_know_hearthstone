part of 'settings_cubit.dart';

sealed class SettingsState {
  final bool darkMode;
  final bool mute;
  final String difficulty;
  final int timer;

  const SettingsState({
    required this.darkMode,
    required this.mute,
    required this.difficulty,
    required this.timer,
  });

  factory SettingsState.initial({
    required bool darkMode,
    required bool mute,
    required String difficulty,
    required int timer,
  }) = _SettingsInitial;

  SettingsState copyWith({
    bool? darkMode,
    bool? mute,
    String? difficulty,
    int? timer,
  }) {
    return SettingsState.initial(
      darkMode: darkMode ?? this.darkMode,
      mute: mute ?? this.mute,
      difficulty: difficulty ?? this.difficulty,
      timer: timer ?? this.timer,
    );
  }
}

final class _SettingsInitial extends SettingsState {
  const _SettingsInitial({
    required super.darkMode,
    required super.mute,
    required super.difficulty,
    required super.timer,
  });
}
