import 'package:flutter/material.dart';
import 'package:pokedex/common/errors.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/common/widgets/po_error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/details/pages/details_page.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

class DetailArgs{
  DetailArgs({required this.pokemon, this.index = 0});
  final Pokemon pokemon;
  final int? index;
}

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({Key? key, required this.repository, required this.args, required this.onBack,}) : super(key: key);
  final PokemonRepository repository;
  final DetailArgs args;
  final VoidCallback onBack;
  @override
  _DetailsContainerState createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  late PageController _controller;
  Pokemon? _pokemon;
  late Future<List<Pokemon>> _future;
  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.args.index!,
    );
    _future =  widget.repository.GetAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            snapshot.hasData) {
          return POLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if(_pokemon == null){
            _pokemon = widget.args.pokemon;
          }
          return DetailsPage(
            pokemon: _pokemon!,
            pokelist: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePokemon: (Pokemon value) {
                setState(() {
                  _pokemon = value;
                });
          },
          );
        }

        if (snapshot.hasError) {
          return POError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
