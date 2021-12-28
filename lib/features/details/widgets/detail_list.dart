import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';

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
      height: 300,
      child: Container(
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
    );
  }
}
