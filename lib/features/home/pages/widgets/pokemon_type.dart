import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(type,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
      ),
    );
  }
}
