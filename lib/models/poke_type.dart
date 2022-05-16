class PokeType {
  final int slot;
  final String name;

  PokeType(this.slot, this.name);

  factory PokeType.fromJson(Map<String, dynamic> json) {
    return PokeType(
      json['slot'],
      json['type']['name'],
    );
  }
}
