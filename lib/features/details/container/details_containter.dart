import 'package:flutter/material.dart';
import 'package:pokedex/common/errors.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/widgets/po_error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/details/pages/details_page.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

class DetailArgs{
  DetailArgs({required this.pokemon});
  final Pokemon pokemon;
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({Key? key, required this.repository, required this.args}) : super(key: key);
  final PokemonRepository repository;
  final DetailArgs args;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.GetAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            snapshot.hasData) {
          return POLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailsPage(pokemon: args.pokemon, pokelist: snapshot.data!,);
        }

        if (snapshot.hasError) {
          return POError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
