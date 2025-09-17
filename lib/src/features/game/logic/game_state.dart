part of 'game_cubit.dart';

sealed class GameState {
  final int score;
  final HearthstoneCard card;
  final String cardArtUrl;

  const GameState({
    required this.score,
    required this.card,
    required this.cardArtUrl,
  });

  GameState copyWith({int? score, HearthstoneCard? card, String? cardArtUrl}) {
    return GameState.initial(
      score: score ?? this.score,
      card: card ?? this.card,
      cardArtUrl: cardArtUrl ?? this.cardArtUrl,
    );
  }

  factory GameState.initial({
    required int score,
    required HearthstoneCard card,
    required String cardArtUrl,
  }) = _GameInitial;
}

final class _GameInitial extends GameState {
  const _GameInitial({
    required super.score,
    required super.card,
    required super.cardArtUrl,
  });
}
