import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/common/consts/api_consts.dart';
import 'package:pokedex/common/errors.dart';
import 'package:pokedex/common/models/pokemon_model.dart';


abstract class IPokemonRepository{
  Future<List<Pokemon>> GetAllPokemons();
}


class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> GetAllPokemons() async {
    try
    {
      final response = await dio.get(ApiConsts.allPokemonURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    }
    catch(e)
    {
      throw Failure(message: 'Não foi possível carregar a lista');
    }
  }
}