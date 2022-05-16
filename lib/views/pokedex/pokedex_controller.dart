import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokedexController extends GetxController {
  Rx<Pokemon> selectedPokemon = Rx<Pokemon>(Pokemon.getNull);
  RxList<Pokemon> pokemons = <Pokemon>[].obs;
  RxBool showDetails = false.obs;

  @override
  void onInit() async {
    await fetchPokemons();
    super.onInit();
  }

  fetchPokemons() async {
    showDetails.value = false;
    pokemons.clear();
    var response = await GetIt.I<PokemonRepository>().fetchPokemons();
    pokemons.addAll(response);
  }

  updatePokemonList() async {
    var response =
        await GetIt.I<PokemonRepository>().fetchPokemons(pokemons.length);

    pokemons.addAll(response);
  }

  getSelectedPokemonId() {
    return selectedPokemon.value.id;
  }

  selectPokemon(Pokemon pokemon) {
    selectedPokemon.value = pokemon;
  }

  searchPokemon(String search) async {
    showDetails.value = false;

    var response =
        await GetIt.I<PokemonRepository>().fetchPokemonByName(search);

    pokemons.clear();

    pokemons.add(response);
  }
}
