import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes.dart';
import '../../telas/widgets/intervencao_item.dart';

class CardListaIntervencoes extends StatelessWidget {
  final Map<int, bool> intervencoes;

  const CardListaIntervencoes({
    super.key,
    required this.intervencoes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: intervencoes.entries
                .where((entry) => entry.value)
                .map((entry) => IntervencaoItem(
                      nome: DadosIntervencoes.lista[entry.key].nome,
                      texto: DadosIntervencoes.lista[entry.key].descricao,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
