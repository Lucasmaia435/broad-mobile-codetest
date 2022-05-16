import 'package:dio/dio.dart';
import 'package:pokedex/service/api.dart';

import '../models/pokemon.dart';

class PokemonRepository {
  final HttpAdapter api;

  PokemonRepository(this.api);

  Future<List<Pokemon>> fetchPokemons([int offSet = 1]) async {
    List<Future<Pokemon>> futures = [];
    for (var i = offSet; i < offSet + 50; i++) {
      futures.add(fetchPokemonById(i));
    }
    var pokemons = await Future.wait(futures);

    return pokemons;
  }

  Future<Pokemon> fetchPokemonById(int id) async {
    Response response = await api.get('pokemon/$id');

    return Pokemon.fromJson(response.data);
  }

  Future<Pokemon> fetchPokemonByName(String name) async {
    try {
      Response response = await api.get('pokemon/${name.toLowerCase()}');

      return Pokemon.fromJson(response.data);
    } catch (e) {
      return Pokemon.getNull;
    }
  }
}
