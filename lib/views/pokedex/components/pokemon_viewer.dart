import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/pokedex/pokedex_controller.dart';

class PokemonViewer extends StatelessWidget {
  PokemonViewer({Key? key}) : super(key: key);

  final PokedexController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.pokeBlue,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Obx(() {
        if (controller.selectedPokemon.value.id == 0) {
          return const Center(
            child: Text(
              'Selecione um pokemon!',
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            controller.selectedPokemon.value.getFormattedName(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            controller.selectedPokemon.value.getFormattedId(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    onPressed: () {
                      controller.showDetails.value =
                          !controller.showDetails.value;
                    },
                    style: OutlinedButton.styleFrom(),
                    child: Text(
                      !controller.showDetails.value
                          ? 'Ver detalhes'
                          : 'Ocultar detalhes',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    controller.selectedPokemon.value.getSprite(),
                    scale: 0.5,
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
