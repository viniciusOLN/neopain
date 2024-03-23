import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/escalas/npass_dor.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes.dart';
import 'package:neonatal_pain_monitor/telas/widgets/rotulo.dart';
import 'package:neonatal_pain_monitor/utils/dados/escalas/opcoes_npass.dart';
import 'package:neonatal_pain_monitor/utils/modelos/conteudo_relatorio.dart';
import 'package:neonatal_pain_monitor/utils/modelos/pergunta.dart';
import 'package:neonatal_pain_monitor/utils/resultado/avaliar_dor.dart';
import 'package:neonatal_pain_monitor/utils/resultado/avaliar_sedacao.dart';
import '../main.dart';
import '../telas/widgets/card_lista_intervencoes.dart';
import '../utils/modelos/dados_bebe.dart';
import 'widgets/card_avaliacao.dart';
import 'widgets/card_dados_bebe.dart';
import '/utils/resultado/calculo.dart';

class MetricaDorNormal extends StatelessWidget {
  final DadosBebe dadosBebe;
  final int score;
  final String avaliacao;
  final List<Question> teste;

  MetricaDorNormal({
    Key? key,
    required this.dadosBebe,
    required this.teste,
    required this.score,
    required this.avaliacao,
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
                            builder: (context) => EscalaNPASSDor(
                                  dadosBebe: dadosBebe,
                                  teste: opcoesNPASS,
                                  score: scoreTestNPasse(opcoesNPASS),
                                  avaliacao: avaliarSedacaoNPass(
                                      scoreTestNPasse(opcoesNPASS)),
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
                  avaliacao: avaliacao,
                  scoreTeste: -1 * score,
                ),
              ],
            ),
          ),
        ));
  }
}
