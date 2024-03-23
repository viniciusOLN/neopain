import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes.dart';
import 'package:neonatal_pain_monitor/telas/widgets/rotulo.dart';
import 'package:neonatal_pain_monitor/utils/modelos/conteudo_relatorio.dart';
import 'package:neonatal_pain_monitor/utils/modelos/pergunta.dart';
import 'package:neonatal_pain_monitor/utils/resultado/avaliar_dor.dart';
import '../main.dart';
import '../telas/widgets/card_lista_intervencoes.dart';
import '../utils/modelos/dados_bebe.dart';
import 'widgets/card_avaliacao.dart';
import 'widgets/card_dados_bebe.dart';
import '/utils/resultado/calculo.dart';

class MetricaDor extends StatelessWidget {
  final DadosBebe dadosBebe;
  final int score;
  final String avaliacao;
  final List<Question> teste;
  final int? scoreDois;
  final String? avaliacaoDois;

  MetricaDor({
    Key? key,
    required this.dadosBebe,
    required this.teste,
    required this.score,
    required this.avaliacao,
    this.scoreDois,
    this.avaliacaoDois,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Métrica de Dor'), actions: [
          TextButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IntervencoesNanda(
                                  dadosBebe: dadosBebe,
                                  teste: teste,
                                  scoreTeste: scoreTeste(teste),
                                  scoreDois: scoreDois,
                                  avaliacaoDois: avaliacaoDois,
                                  avaliacao: avaliarDor(scoreTeste(teste)),
                                )))
                  },
              child: const Text('Prosseguir'))
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardAvaliacao(
                  avaliacao: avaliacao,
                  scoreTeste: score,
                ),
              ],
            ),
          ),
        ));
  }
}
