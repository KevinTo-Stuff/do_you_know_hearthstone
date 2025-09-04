part of 'game_cubit.dart';

sealed class GameState {
  final int score;

  const GameState({required this.score});

  factory GameState.initial({required int score}) = _GameInitial;
}

final class _GameInitial extends GameState {
  const _GameInitial({required super.score});
}
