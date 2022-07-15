import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/features/details/container/details_container.dart';
import 'package:pokedex/features/home/pages/widgets/pokemon_type.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem(
      {Key? key, required this.pokemon, required this.onTap, required this.index})
      : super(key: key);
  final Pokemon pokemon;
  final Function(String, DetailArgs) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        onTap: () =>
            onTap('/details', DetailArgs(pokemon: pokemon, index: index),
            ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(pokemon.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        ),
                        Text(pokemon.num,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: pokemon.type.map((e) =>
                              PokemonType(type: e))
                              .toList(),
                        ),
                        Flexible(child: Image.network(
                          pokemon.image, height: 90, width: 90,
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
