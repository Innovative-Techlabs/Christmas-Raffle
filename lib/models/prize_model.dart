import 'dart:convert';

List<Prize> prizeFromJson(String str) =>
    List<Prize>.from(json.decode(str).map((x) => Prize.fromJson(x)));

String prizeToJson(List<Prize> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prize {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final int value;
  final String tier;
  final int quantity;

  Prize({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.value,
    required this.tier,
    required this.quantity,
  });

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        value: json["value"],
        tier: json["tier"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "imageUrl": imageUrl,
        "value": value,
        "tier": tier,
        "quantity": quantity,
      };

  static bool getPrizeIcon(int entries, String tier) {
    if (entries > 0 && tier == 'Tier 1') {
      return true;
    }
    if (entries > 70 && tier == 'Tier 2') {
      return true;
    }
    if (entries > 150 && tier == 'Tier 3') {
      return true;
    } else {
      return false;
    }
  }
}
