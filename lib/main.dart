import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home/container/home_container.dart';
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
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
