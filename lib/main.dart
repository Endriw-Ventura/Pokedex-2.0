import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/Pokedex/pokedex_routes.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex Flutter 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokedexRoutes(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
