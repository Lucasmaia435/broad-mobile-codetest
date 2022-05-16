import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/pokedex/pokedex_controller.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  final PokedexController controller = Get.find<PokedexController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: AppColors.pokeBlue,
        shape: PixelBorder.solid(
          color: AppColors.pokeGreen,
          borderRadius: BorderRadius.circular(6),
          pixelSize: 6,
        ),
      ),
      child: TextField(
        cursorColor: Colors.white,
        cursorHeight: 16,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          label: const Text('Pesquise um pokemon'),
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        onSubmitted: (String search) {
          if (search.isEmpty) {
            controller.fetchPokemons();
          } else {
            controller.searchPokemon(search.trim());
          }
        },
      ),
    );
  }
}
