class PokeStats {
  final String name;
  final int value;

  PokeStats(this.name, this.value);

  factory PokeStats.fromJson(Map<String, dynamic> json) {
    return PokeStats(
      json['stat']['name'],
      json['base_stat'],
    );
  }
}
