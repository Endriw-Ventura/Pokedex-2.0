import 'package:flutter/material.dart';
import 'package:pokedex/features/details/container/details_containter.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

class PokedexRoutes extends StatelessWidget {
  const PokedexRoutes({Key? key, required this.repository}) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository, onItemTap: (route, args) {
              Navigator.of(context).pushNamed(route, arguments: args);
            },
            );
          },
          );
        }
        if(settings.name == '/details'){
          return MaterialPageRoute(builder: (context) {
            return DetailsContainer(repository: repository,
            args: (settings.arguments as DetailArgs),
            );
          });
        }
      },
    );
  }
}
