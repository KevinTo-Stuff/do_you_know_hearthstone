// Project imports:
import 'package:do_you_know_hearthstone/src/shared/models/enums.dart';

class HearthstoneCard {
  final String id;
  final int dbfId;
  final String name;
  final String? text;
  final String? flavor;
  final int? armor;
  final String? artist;
  final int? attack;
  final CardClass? cardClass;
  final bool? collectible;
  final int? cost;
  final int? durability;
  final bool? elite;
  final Faction? faction;
  final int? health;
  final bool? hideStats;
  final List<String>? mechanics;
  final Rarity? rarity;
  final Set? set;
  final CardType? type;

  HearthstoneCard({
    required this.id,
    required this.dbfId,
    required this.name,
    this.text,
    this.flavor,
    this.armor,
    this.artist,
    this.attack,
    this.cardClass,
    this.collectible,
    this.cost,
    this.durability,
    this.elite,
    this.faction,
    this.health,
    this.hideStats,
    this.mechanics,
    this.rarity,
    this.set,
    this.type,
  });

  factory HearthstoneCard.blank() {
    return HearthstoneCard(
      id: '',
      dbfId: 0,
      name: '',
      text: null,
      flavor: null,
      armor: null,
      artist: null,
      attack: null,
      cardClass: null,
      collectible: null,
      cost: null,
      durability: null,
      elite: null,
      faction: null,
      health: null,
      hideStats: null,
      mechanics: null,
      rarity: null,
      set: null,
      type: null,
    );
  }

  factory HearthstoneCard.fromJson(Map<String, dynamic> json) {
    return HearthstoneCard(
      id: json['id'] as String,
      dbfId: json['dbfId'] as int,
      name: json['name'] as String,
      text: json['text'] != null ? json['text'] as String : null,
      flavor: json['flavor'] != null ? json['flavor'] as String : null,
      armor: json['armor'] != null ? json['armor'] as int : null,
      artist: json['artist'] != null ? json['artist'] as String : null,
      attack: json['attack'] != null ? json['attack'] as int : null,
      cardClass: json['cardClass'] != null
          ? _stringtoCardClass(json['cardClass'])
          : null,
      collectible: json['collectible'] != null
          ? json['collectible'] as bool
          : null,
      cost: json['cost'] != null ? json['cost'] as int : null,
      durability: json['durability'] != null ? json['durability'] as int : null,
      elite: json['elite'] != null ? json['elite'] as bool : null,
      faction: json['faction'] != null
          ? _stringToFaction(json['faction'])
          : null,
      health: json['health'] != null ? json['health'] as int : null,
      hideStats: json['hideStats'] != null ? json['hideStats'] as bool : null,
      mechanics: json['mechanics'] != null
          ? (json['mechanics'] as List<dynamic>)
                .map((e) => e as String)
                .toList()
          : null,
      rarity: json['rarity'] != null ? _stringToRarity(json['rarity']) : null,
      set: json['set'] != null ? _stringToSet(json['set']) : null,
      type: json['type'] != null ? _stringToCardType(json['type']) : null,
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

  static CardClass _stringtoCardClass(String cardClass) {
    return CardClass.invalid;
  }

  static Set _stringToSet(String set) {
    return Set.invalid;
  }

  static CardType _stringToCardType(String cardType) {
    return CardType.invalid;
  }

  static Rarity _stringToRarity(String rarity) {
    return Rarity.invalid;
  }

  static Faction _stringToFaction(String faction) {
    return Faction.invalid;
  }
}
