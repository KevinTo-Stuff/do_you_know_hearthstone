// Project imports:
import 'card.dart';

class Hero extends Card {
  final int armor;

  Hero({
    required super.id,
    required super.name,
    required super.type,
    required super.cost,
    required super.text,
    required this.armor,
    required super.origin,
  });
}
