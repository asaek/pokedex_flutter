import 'dart:convert';

class PokemonDbResponse {
  final int height;
  final int id;
  final List<MoveElement> moves;
  final String name;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  PokemonDbResponse({
    required this.height,
    required this.id,
    required this.moves,
    required this.name,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonDbResponse.fromRawJson(String str) =>
      PokemonDbResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonDbResponse.fromJson(Map<String, dynamic> json) =>
      PokemonDbResponse(
        height: json["height"],
        id: json["id"],
        moves: List<MoveElement>.from(
            json["moves"].map((x) => MoveElement.fromJson(x))),
        name: json["name"],
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "id": id,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}

class MoveElement {
  final StatClass move;

  MoveElement({
    required this.move,
  });

  factory MoveElement.fromRawJson(String str) =>
      MoveElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoveElement.fromJson(Map<String, dynamic> json) => MoveElement(
        move: StatClass.fromJson(json["move"]),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
      };
}

class StatClass {
  final String name;

  StatClass({
    required this.name,
  });

  factory StatClass.fromRawJson(String str) =>
      StatClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatClass.fromJson(Map<String, dynamic> json) => StatClass(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Species {
  final String name;
  String urlDescripcion;

  Species({
    required this.name,
    required this.urlDescripcion,
  });

  factory Species.fromRawJson(String str) => Species.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        urlDescripcion: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": urlDescripcion,
      };
}

class Sprites {
  final Other other;

  Sprites({
    required this.other,
  });

  factory Sprites.fromRawJson(String str) => Sprites.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "other": other.toJson(),
      };
}

class Other {
  final OfficialArtwork officialArtwork;

  Other({
    required this.officialArtwork,
  });

  factory Other.fromRawJson(String str) => Other.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork.toJson(),
      };
}

class OfficialArtwork {
  final String frontDefault;
  final String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromRawJson(String str) =>
      OfficialArtwork.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Stat {
  final int baseStat;
  final StatClass stat;

  Stat({
    required this.baseStat,
    required this.stat,
  });

  factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        stat: StatClass.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat.toJson(),
      };
}

class Type {
  final int slot;
  final StatClass type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: StatClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
