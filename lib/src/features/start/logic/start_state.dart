part of 'start_cubit.dart';

sealed class StartState {
  final String name;

  const StartState({required this.name});

  factory StartState.initial({required String name}) = _StartInitial;

  factory StartState.success({required String name}) = _StartFinished;

  void when({
    required void Function(String name) initial,
    required void Function(String name) success,
  }) {
    if (this is _StartInitial) {
      initial(name);
    } else if (this is _StartFinished) {
      success(name);
    }
  }

  void whenOrNull({
    void Function(String name)? initial,
    void Function(String name)? success,
  }) {
    if (this is _StartInitial) {
      initial?.call(name);
    } else if (this is _StartFinished) {
      success?.call(name);
    }
  }
}

final class _StartInitial extends StartState {
  const _StartInitial({required super.name});
}

final class _StartFinished extends StartState {
  const _StartFinished({required super.name});
}
