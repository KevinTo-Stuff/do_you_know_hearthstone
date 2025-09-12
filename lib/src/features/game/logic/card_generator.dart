// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart' show rootBundle;

// Project imports:
import 'package:do_you_know_hearthstone/src/shared/models/enums.dart';
import 'package:do_you_know_hearthstone/src/shared/models/hearthstone_card.dart';

class CardGenerator {
  List<HearthstoneCard> cards = [];

  CardGenerator();

  Future<void> loadCards() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/cards.collectible.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<HearthstoneCard> processedCards = jsonList
        .map((json) => HearthstoneCard.fromJson(json as Map<String, dynamic>))
        .toList();

    // Remove Hero skins
    processedCards.removeWhere(
      (card) =>
          card.type == CardType.hero &&
          (card.text == null || card.text!.trim().isEmpty),
    );
    cards = processedCards;
  }

  Future<HearthstoneCard> getRandomCard() async {
    if (cards.isEmpty) {
      await loadCards();
    }

    cards.shuffle();
    return cards.first;
  }
}
