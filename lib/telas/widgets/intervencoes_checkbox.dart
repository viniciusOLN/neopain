import 'package:flutter/material.dart';
import '../../utils/modelos/intervencao.dart';
import '../../utils/dados/intervencoes.dart';

class IntervencoesCheckbox extends StatelessWidget {
  final Intervencao intervencao;
  final Map<int, bool> selecionadas;
  final Function(bool?)? onChanged;

  const IntervencoesCheckbox(
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
        value: selecionadas[DadosIntervencoes.lista.indexOf(intervencao)],
        onChanged: onChanged);
  }
}
