import 'card.dart';

class Location extends Card {
  final int armor;

  Location({
    required super.id,
    required super.name,
    required super.type,
    required super.cost,
    required super.text,
    required this.armor,
    required super.origin,
  });
}
