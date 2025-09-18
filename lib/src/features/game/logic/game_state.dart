part of 'game_cubit.dart';

sealed class GameState {
  final int score;
  final HearthstoneCard card;

  const GameState({required this.score, required this.card});

  GameState copyWith({int? score, HearthstoneCard? card, String? cardArtUrl}) {
    return GameState.initial(
      score: score ?? this.score,
      card: card ?? this.card,
    );
  }

  factory GameState.initial({
    required int score,
    required HearthstoneCard card,
  }) = _GameInitial;
}

final class _GameInitial extends GameState {
  const _GameInitial({required super.score, required super.card});
}
