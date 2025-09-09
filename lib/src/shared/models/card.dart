class HearthstoneCard {
  final String id;
  final int dbfId;
  final String name;
  final String text;
  final String flavor;
  final String artist;
  final int attack;
  final String cardClass;
  final bool collectible;
  final int cost;
  final bool elite;
  final String faction;
  final int health;
  final List<String> mechanics;
  final String rarity;
  final String set;
  final String type;

  HearthstoneCard({
    required this.id,
    required this.dbfId,
    required this.name,
    required this.text,
    required this.flavor,
    required this.artist,
    required this.attack,
    required this.cardClass,
    required this.collectible,
    required this.cost,
    required this.elite,
    required this.faction,
    required this.health,
    required this.mechanics,
    required this.rarity,
    required this.set,
    required this.type,
  });

  factory HearthstoneCard.fromJson(Map<String, dynamic> json) {
    return HearthstoneCard(
      id: json['id'] as String,
      dbfId: json['dbfId'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      flavor: json['flavor'] as String,
      artist: json['artist'] as String,
      attack: json['attack'] as int,
      cardClass: json['cardClass'] as String,
      collectible: json['collectible'] as bool,
      cost: json['cost'] as int,
      elite: json['elite'] as bool,
      faction: json['faction'] as String,
      health: json['health'] as int,
      mechanics: (json['mechanics'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rarity: json['rarity'] as String,
      set: json['set'] as String,
      type: json['type'] as String,
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
