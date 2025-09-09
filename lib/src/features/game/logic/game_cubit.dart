// Package imports:
import 'package:do_you_know_hearthstone/src/features/game/logic/card_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:do_you_know_hearthstone/src/shared/models/hearthstone_card.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final CardGenerator generator = CardGenerator();

  GameCubit() : super(_GameInitial(score: 0, card: HearthstoneCard.blank()));

  Future<void> generateCard() async {
    final newCard = await generator.getRandomCard();
    emit(_GameInitial(score: 0, card: newCard));
  }
}
