// Project imports:
import 'card.dart';

class Minion extends Card {
  final int attack;
  final int health;
  final String? tribe;

  Minion({
    required super.id,
    required super.name,
    required super.type,
    required super.cost,
    required super.text,
    required this.attack,
    required this.health,
    required super.origin,
    this.tribe,
  });
}
