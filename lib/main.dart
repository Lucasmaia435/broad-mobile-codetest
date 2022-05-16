import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/service/api.dart';
import 'package:pokedex/views/pokedex/pokedex_controller.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  GetIt.I.registerSingleton<HttpAdapter>(HttpAdapter());
  GetIt.I.registerSingleton(PokemonRepository(GetIt.I.get()));
  Get.put(PokedexController());
}
