List<T> fromJsonList<T>(List<dynamic> json, constructor) {
  List<T> elements = [];
  for (Map<String, dynamic> element in json) {
    elements.add(constructor(element));
  }

  return elements;
}
