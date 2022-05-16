import 'package:dio/dio.dart';

class HttpAdapter {
  Dio client = Dio()..options.baseUrl = 'https://pokeapi.co/api/v2/';

  get(String path) async {
    return client.get(path);
  }
}
