import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.pokemon, required this.pokelist}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> pokelist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: pokemon.baseColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ListView(
                  children: pokelist.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.name),
                  )).toList(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
