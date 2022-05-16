import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/colors.dart';

import '../pokedex_controller.dart';

class PokemonListTile extends StatelessWidget {
  final Pokemon pokemon;
  final bool isSelected;
  final Function onPressed;
  final PokedexController controller = Get.find();

  PokemonListTile({
    Key? key,
    required this.pokemon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.pokeBlue,
          border: isSelected ? Border.all(color: Colors.white, width: 5) : null,
        ),
        padding: !isSelected
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
            : const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Text(
              pokemon.getFormattedId(),
              style: const TextStyle(color: Colors.white),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Text(
              pokemon.getFormattedName(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            CachedNetworkImage(
              imageUrl: pokemon.getSprite(),
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
