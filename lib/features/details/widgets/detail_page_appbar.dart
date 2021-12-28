import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({Key? key, required this.pokemon, required this.onBack}) : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
    );
  }
}
