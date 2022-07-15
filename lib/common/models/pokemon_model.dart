import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final String num;
  final List<String> type;
  final List<String> weaknesses;
  final String height;
  final String weight;
  final String candy;
  final String egg;

  factory Pokemon.fromMap(Map<String, dynamic> json){
    return Pokemon(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      egg: json['egg'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>).map((e) => e as String).toList(),
      num: json['num'],
      id: json['id'],
    );
  }

  Color? get baseColor => _color(type: type[0]);
  String get image => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  Pokemon(
      {required this.name, required this.type, required this.num, required this.id, required this.weaknesses, required this.height, required this.weight, required this.candy, required this.egg, });

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighter':
        return Colors.grey;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}