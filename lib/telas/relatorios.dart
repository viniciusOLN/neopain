import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/relatorio.dart';
import 'package:neonatal_pain_monitor/utils/modelos/conteudo_relatorio.dart';
import 'widgets/relatorio_card.dart';

class Relatorios extends StatelessWidget {
  final List<ConteudoRelatorio>? relatorios;

  const Relatorios({
    super.key,
    this.relatorios,
  });

  @override
  Widget build(BuildContext context) {
    if (relatorios != null) {
      return ListView.builder(
        itemCount: relatorios?.length,
        itemBuilder: (context, index) {
          final relatorio = relatorios![index];

          return RelatorioCard(
            nome: relatorio.dadosBebe.nomern!,
            avaliacao: relatorio.avaliacao,
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Relatorio(
                    dadosBebe: relatorio.dadosBebe,
                    avaliacao: relatorio.avaliacao,
                    intervencoes: relatorio.intervencoes,
                    scoreTeste: relatorio.scoreTeste,
                    nanda: relatorio.intervencoesNanda,
                  ),
                ),
              ),
            },
          );
        },
      );
    }

    // return const Center(child: Text('Nenhum relatório'));
    return Container();
  }
}
