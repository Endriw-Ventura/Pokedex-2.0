import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/features/details/widgets/detail_list.dart';
import 'package:pokedex/features/details/widgets/detail_page_appbar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {Key? key, required this.pokemon, required this.pokelist, required this.onBack, required this.controller, required this.onChangePokemon})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> pokelist;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailPageAppBar(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailList(
            pokemon: pokemon,
            list: pokelist,
            controller: controller,
            onChangePokemon: onChangePokemon,
          ),
        ],
      ),
    );
  }
}
