import 'package:flutter/material.dart';

class Rotulo extends StatelessWidget {
  final String texto;
  const Rotulo({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
