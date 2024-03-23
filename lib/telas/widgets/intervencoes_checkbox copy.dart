import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes%20copy.dart';
import '../../utils/modelos/intervencao.dart';
import '../../utils/dados/intervencoes.dart';

class IntervencoesCheckboxNanda extends StatelessWidget {
  final Intervencao intervencao;
  final Map<int, bool> selecionadas;
  final Function(bool?)? onChanged;

  const IntervencoesCheckboxNanda(
      {super.key,
      required this.intervencao,
      required this.onChanged,
      required this.selecionadas});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(
          intervencao.nome,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(intervencao.descricao),
        value: selecionadas[DadosIntervencoesNanda.lista.indexOf(intervencao)],
        onChanged: onChanged);
  }
}
