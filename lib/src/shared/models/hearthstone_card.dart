// Project imports:
import 'package:do_you_know_hearthstone/src/shared/models/enums.dart';

class HearthstoneCard {
  final String id;
  final int dbfId;
  final String name;
  final String text;
  final String flavor;
  final int armor;
  final String artist;
  final int attack;
  final CardClass cardClass;
  final bool collectible;
  final int cost;
  final int durability;
  final bool elite;
  final Faction faction;
  final int health;
  final bool hideStats;
  final List<String> mechanics;
  final Rarity rarity;
  final Set set;
  final CardType type;

  HearthstoneCard({
    required this.id,
    required this.dbfId,
    required this.name,
    required this.text,
    required this.flavor,
    required this.armor,
    required this.artist,
    required this.attack,
    required this.cardClass,
    required this.collectible,
    required this.cost,
    required this.durability,
    required this.elite,
    required this.faction,
    required this.health,
    required this.hideStats,
    required this.mechanics,
    required this.rarity,
    required this.set,
    required this.type,
  });

  factory HearthstoneCard.blank() {
    return HearthstoneCard(
      id: '',
      dbfId: 0,
      name: '',
      text: '',
      flavor: '',
      armor: 0,
      artist: '',
      attack: 0,
      cardClass: CardClass.invalid,
      collectible: false,
      cost: 0,
      durability: 0,
      elite: false,
      faction: Faction.invalid,
      health: 0,
      hideStats: false,
      mechanics: [],
      rarity: Rarity.invalid,
      set: Set.invalid,
      type: CardType.invalid,
    );
  }

  factory HearthstoneCard.fromJson(Map<String, dynamic> json) {
    return HearthstoneCard(
      id: json['id'] as String,
      dbfId: json['dbfId'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      flavor: json['flavor'] as String,
      armor: json['armor'] as int,
      artist: json['artist'] as String,
      attack: json['attack'] as int,
      cardClass: json['cardClass'] as CardClass,
      collectible: json['collectible'] as bool,
      cost: json['cost'] as int,
      durability: json['durability'] as int,
      elite: json['elite'] as bool,
      faction: json['faction'] as Faction,
      health: json['health'] as int,
      hideStats: json['hideStats'] as bool,
      mechanics: (json['mechanics'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rarity: json['rarity'] as Rarity,
      set: json['set'] as Set,
      type: json['type'] as CardType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dbfId': dbfId,
      'name': name,
      'text': text,
      'flavor': flavor,
      'artist': artist,
      'attack': attack,
      'cardClass': cardClass,
      'collectible': collectible,
      'cost': cost,
      'elite': elite,
      'faction': faction,
      'health': health,
      'mechanics': mechanics,
      'rarity': rarity,
      'set': set,
      'type': type,
    };
  }
}
