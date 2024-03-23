import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes.dart';
import '../../telas/widgets/intervencao_item.dart';

class CardListaIntervencoesNanda extends StatelessWidget {
  final Map<int, bool> intervencoes;

  const CardListaIntervencoesNanda({
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
                      nome: DadosIntervencoesNanda.lista[entry.key].nome,
                      texto: DadosIntervencoesNanda.lista[entry.key].descricao,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
