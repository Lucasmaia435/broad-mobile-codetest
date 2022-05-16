import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/pokedex/pokedex_controller.dart';

import 'pokemon_list_tile.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final PokedexController controller = Get.find();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent / 2) {
        controller.updatePokemonList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pokeBlue,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      child: Obx(() {
        Pokemon selectedPokemon = controller.selectedPokemon.value;
        List<Pokemon> pokemons = controller.pokemons;
        if (pokemons.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (pokemons.length == 1 && pokemons.first.id == 0) {
          return const Center(
            child: Text(
              'Pokemon pesquisado não encontrado.\nTente Novamente!',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
            controller: scrollController,
            itemCount: controller.pokemons.length,
            itemBuilder: (context, index) {
              return PokemonListTile(
                onPressed: () {
                  controller.selectedPokemon(pokemons[index]);
                },
                isSelected: selectedPokemon.id == pokemons[index].id,
                pokemon: pokemons[index],
                key: Key(pokemons[index].getFormattedId()),
              );
            });
      }),
    );
  }
}
