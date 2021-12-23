import 'package:flutter/material.dart';
import 'package:pokedex/common/errors.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/features/details/container/details_containter.dart';
import 'package:pokedex/features/home/pages/home_error.dart';
import 'package:pokedex/features/home/pages/home_loading.dart';
import 'package:pokedex/features/home/pages/home_page.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository, required this.onItemTap}) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArgs) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.GetAllPokemons(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting &&
          snapshot.hasData) {
        return HomeLoading();
      }

      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return HomePage(list: snapshot.data!, onItemTap: onItemTap);
      }

      if (snapshot.hasError) {
        return HomeError(error: (snapshot.error as Failure).message!);
      }

      return Container();
    },
    );
  }
}
