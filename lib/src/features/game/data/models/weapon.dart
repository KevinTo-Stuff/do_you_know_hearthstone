import 'card.dart';

class Weapon extends Card {
  final int durability;

  Weapon({
    required super.id,
    required super.name,
    required super.type,
    required super.cost,
    required super.text,
    required this.durability,
    required super.origin,
  });
}
