import 'card.dart';

class Spell extends Card {
  final String? spellSchool;

  Spell({
    required super.id,
    required super.name,
    required super.type,
    required super.cost,
    required super.text,
    this.spellSchool,
    required super.origin,
  });
}
