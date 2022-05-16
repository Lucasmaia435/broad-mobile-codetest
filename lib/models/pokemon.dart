import 'package:pokedex/models/poke_stats.dart';
import 'package:pokedex/models/specie.dart';

import '../utils/formatter.dart';
import '../utils/json_list_formatter.dart';
import 'poke_type.dart';

class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final Specie specie;
  final List<PokeType> types;
  final List<PokeStats> stats;

  Pokemon(
    this.id,
    this.height,
    this.weight,
    this.specie,
    this.types,
    this.name,
    this.stats,
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      json['id'],
      json['height'],
      json['weight'],
      Specie.fromJson(json['species']),
      fromJsonList<PokeType>(json['types'], PokeType.fromJson),
      json['name'],
      fromJsonList<PokeStats>(json['stats'], PokeStats.fromJson),
    );
  }

  String getSprite() {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
  }

  String getImage() {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }

  String getFormattedId() {
    return '#${formatId(id)}';
  }

  String getFormattedName() {
    return name.replaceFirst(name[0], name[0].toUpperCase());
  }

  static get getNull => Pokemon(0, 0, 0, Specie('null', 'null'), [], '', []);
  @override
  String toString() {
    return name;
  }
}
