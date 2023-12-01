import 'dart:convert';

class DescripcionDbResponse {
  final List<FlavorTextEntry> flavorTextEntries;
  final int id;
  final String name;

  DescripcionDbResponse({
    required this.flavorTextEntries,
    required this.id,
    required this.name,
  });

  factory DescripcionDbResponse.fromRawJson(String str) =>
      DescripcionDbResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DescripcionDbResponse.fromJson(Map<String, dynamic> json) =>
      DescripcionDbResponse(
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "id": id,
        "name": name,
      };
}

class FlavorTextEntry {
  final String flavorText;

  FlavorTextEntry({
    required this.flavorText,
  });

  factory FlavorTextEntry.fromRawJson(String str) =>
      FlavorTextEntry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
      };
}
