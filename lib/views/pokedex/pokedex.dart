import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/pokedex/components/search_bar.dart';
import 'package:pokedex/views/pokedex/pokedex_controller.dart';
import 'components/pokemon_detail.dart';
import 'components/pokemon_list.dart';
import 'components/pokemon_viewer.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final PokedexController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pokeRed,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            PokemonViewer(),
            SearchBar(),
            Expanded(
              child: Obx(
                () => !controller.showDetails.value
                    ? const PokemonList()
                    : PokemonDetail(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
