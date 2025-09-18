// Package imports:
import 'package:do_you_know_hearthstone/src/features/game/data/hearthstone_card_art_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/features/game/logic/card_generator.dart';
import 'package:do_you_know_hearthstone/src/shared/models/hearthstone_card.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final CardGenerator generator = CardGenerator();
  final HearthstoneCardArtService artService = HearthstoneCardArtService();

  GameCubit() : super(_GameInitial(score: 0, card: HearthstoneCard.blank())) {
    _initialize();
  }

  Future<void> _initialize() async {
    generateCard();
  }

  Future<void> generateCard() async {
    final HearthstoneCard newCard = await generator.getRandomCard();

    final GameState newState = state.copyWith(card: newCard);
    emit(_GameInitial(score: newState.score, card: newState.card));
  }
}
