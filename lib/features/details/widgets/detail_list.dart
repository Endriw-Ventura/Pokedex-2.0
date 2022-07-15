import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/features/home/pages/widgets/pokemon_weaknesses.dart';

class DetailList extends StatelessWidget {
  const DetailList(
      {Key? key, required this.pokemon, required this.list, required this.controller, required this.onChangePokemon})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 118,
      left: 0,
      right: 0,
      height: 700,
      child: Column(
        children: [
          Container(
            color: pokemon.baseColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(pokemon.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Text(pokemon.num,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 5),
                  child: SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: PageView(
                      onPageChanged: (index) => onChangePokemon(list[index]),
                      controller: controller,
                      children: list.map((e) {
                        bool diff = e.name != pokemon.name;
                        return AnimatedOpacity(
                          opacity: diff ? 0.4 : 1.0,
                          duration: Duration(milliseconds: 500),
                          child: Image.network(
                            e.image,
                            fit: diff ? null : BoxFit.fitHeight,
                            color: diff ? Colors.black.withOpacity(0.8) : null,
                          ),
                        );
                      },
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Text(
              "Status",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("weaknesses:",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Column(
                      children: pokemon.weaknesses.map((e) =>
                          PokemonWeaknesses(weakness: e)).toList(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("Information:",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Column(
                        children: [
                          Text("Candy: ${pokemon.candy}",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text("Egg: ${pokemon.egg}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text("Weight: ${pokemon.weight}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text("Height: ${pokemon.height}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
