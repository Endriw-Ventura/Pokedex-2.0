import 'package:flutter/material.dart';

class PokemonWeaknesses extends StatelessWidget {
  const PokemonWeaknesses({Key? key, required this.weakness}) : super(key: key);
  final String weakness;

  @override
  Widget build(BuildContext context) {
    return Text(weakness,
        style: TextStyle(
          fontSize: 24,
          color: weakColor(type: weakness),
        ),
    );
  }



  static Color? weakColor({required String type}) {
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
