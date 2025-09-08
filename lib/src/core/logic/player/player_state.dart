part of 'player_cubit.dart';

sealed class PlayerState {
  final String name;

  const PlayerState({required this.name});

  factory PlayerState.initial({required String name}) = _PlayerInitial;
}

final class _PlayerInitial extends PlayerState {
  const _PlayerInitial({required super.name});
}
