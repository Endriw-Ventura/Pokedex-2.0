import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.name, required this.pokelist}) : super(key: key);
  final String name;
  final List<Pokemon> pokelist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              children: pokelist.map((e) => Text(e.name)).toList(),
            ),
          )
        ],
      )
    );
  }
}
