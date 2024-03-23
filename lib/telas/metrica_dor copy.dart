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

class MetricaDorDoisValores extends StatelessWidget {
  final DadosBebe dadosBebe;
  final int score;
  final String avaliacao;
  final int scoreDois;
  final String avaliacaoDois;
  final List<Question> teste;

  MetricaDorDoisValores({
    Key? key,
    required this.dadosBebe,
    required this.teste,
    required this.score,
    required this.avaliacao,
    required this.scoreDois,
    required this.avaliacaoDois,
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Rotulo(texto: 'N-Pass Dor'),
                ),
                CardAvaliacao(
                  avaliacao: avaliacao,
                  scoreTeste: score,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Rotulo(texto: 'N-Pass Sedação'),
                ),
                CardAvaliacao(
                  avaliacao: avaliacaoDois,
                  scoreTeste: scoreDois * -1,
                ),
              ],
            ),
          ),
        ));
  }
}
