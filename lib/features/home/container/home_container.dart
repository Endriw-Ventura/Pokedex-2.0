import 'package:flutter/material.dart';
import 'package:pokedex/commom/errors.dart';
import 'package:pokedex/commom/models/pokemon_model.dart';
import 'package:pokedex/features/home/pages/home_error.dart';
import 'package:pokedex/features/home/pages/home_loading.dart';
import 'package:pokedex/features/home/pages/home_page.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;
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
        return HomePage(list: snapshot.data!);
      }

      if (snapshot.hasError) {
        return HomeError(error: (snapshot.error as Failure).message!);
      }

      return Container();
    },
    );
  }
}
