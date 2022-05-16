class Specie {
  final String name;
  final String url;

  Specie(this.name, this.url);

  factory Specie.fromJson(Map<String, dynamic> json) {
    return Specie(
      json['name'],
      json['url'],
    );
  }
}
