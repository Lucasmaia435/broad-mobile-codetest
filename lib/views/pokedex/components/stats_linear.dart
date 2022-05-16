import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:pokedex/models/poke_stats.dart';
import 'package:pokedex/utils/colors.dart';

class StatsLinear extends StatelessWidget {
  const StatsLinear({Key? key, required this.stats}) : super(key: key);

  final PokeStats stats;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${stats.name}:',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: PixelBorder.solid(
                    borderRadius: BorderRadius.circular(4.0),
                    pixelSize: 2.0,
                    color: AppColors.pokeRed,
                  ),
                ),
                height: 20.0,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 16.0,
                width: MediaQuery.of(context).size.width * (stats.value / 300),
                margin: const EdgeInsets.all(2),
                decoration: ShapeDecoration(
                  shape: PixelBorder.solid(
                    borderRadius: BorderRadius.circular(4.0),
                    pixelSize: 2.0,
                    color: AppColors.pokeGreen,
                  ),
                ),
                child: ColoredBox(color: AppColors.pokeGreen),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
