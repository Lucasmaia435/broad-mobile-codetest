import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/pokedex/components/stats_linear.dart';
import 'package:pokedex/views/pokedex/pokedex_controller.dart';

class PokemonDetail extends StatelessWidget {
  PokemonDetail({Key? key}) : super(key: key);

  final PokedexController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.pokeBlue,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      child: Obx(() {
        Pokemon pokemon = controller.selectedPokemon.value;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Altura:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${pokemon.height / 10} m',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Peso:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${pokemon.weight / 10} kg',
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            ...pokemon.stats.map((stats) => StatsLinear(stats: stats)),
          ],
        );
      }),
    );
  }
}
