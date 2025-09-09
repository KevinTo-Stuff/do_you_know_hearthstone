// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart' show rootBundle;

// Project imports:
import 'package:do_you_know_hearthstone/src/shared/models/hearthstone_card.dart';

class CardGenerator {
  CardGenerator();

  Future<HearthstoneCard> getRandomCard() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/cards.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    final List<HearthstoneCard> cards = jsonList
        .map((json) => HearthstoneCard.fromJson(json as Map<String, dynamic>))
        .toList();
    cards.shuffle();
    return cards.first;
  }
}
