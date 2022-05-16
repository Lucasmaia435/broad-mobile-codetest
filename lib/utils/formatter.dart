String formatId(int id) {
  int aditionalZeros = 3 - id.toString().length;

  return '0' * aditionalZeros + id.toString();
}
