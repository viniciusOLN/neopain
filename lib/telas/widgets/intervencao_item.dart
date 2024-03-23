import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/widgets/descricao.dart';
import 'package:neonatal_pain_monitor/telas/widgets/rotulo.dart';

class IntervencaoItem extends StatelessWidget {
  final String nome;
  final String texto;

  const IntervencaoItem({super.key, required this.nome, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Rotulo(texto: nome), Descricao(texto: texto)],
    );
  }
}
