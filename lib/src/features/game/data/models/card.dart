class Card {
  final String id;
  final String name;
  final String type;
  final int cost;
  final String text;
  final String? imageUrl;
  final String origin;

  Card({
    required this.id,
    required this.name,
    required this.type,
    required this.cost,
    required this.text,
    this.imageUrl,
    required this.origin,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      cost: json['cost'] as int,
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String?,
      origin: json['class'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'cost': cost,
      'text': text,
      'imageUrl': imageUrl,
      'heroClass': origin,
    };
  }
}
