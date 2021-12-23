import 'package:flutter/material.dart';

class POError extends StatelessWidget {
  const POError({Key? key, this.error}) : super(key: key);
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Não foi possível carregar a lista.'),
      ),
    );
  }
}
