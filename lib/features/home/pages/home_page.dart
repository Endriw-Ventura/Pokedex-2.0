

import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon_model.dart';
import 'package:pokedex/features/details/container/details_containter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap}) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArgs) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].name),
              onTap: () => onItemTap('/details', DetailArgs(name: list[index].name)),
            );
          }
      ),
    );
  }
}
