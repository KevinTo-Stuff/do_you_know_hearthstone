part of 'settings_cubit.dart';

sealed class SettingsState {
  final Settings settings;

  const SettingsState({required this.settings});

  factory SettingsState.initial({required Settings settings}) =
      _SettingsInitial;
}

final class _SettingsInitial extends SettingsState {
  const _SettingsInitial({required super.settings});
}
