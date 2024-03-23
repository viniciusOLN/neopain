import 'package:flutter/material.dart';

class Descricao extends StatelessWidget {
  final String texto;

  const Descricao({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
