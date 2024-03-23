import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/telas/metrica_dor%20copy.dart';
import 'package:neonatal_pain_monitor/telas/metrica_dor.dart';
import 'package:neonatal_pain_monitor/utils/modelos/pergunta.dart';
import 'package:neonatal_pain_monitor/utils/resultado/avaliar_sedacao.dart';
import 'package:neonatal_pain_monitor/utils/resultado/calculo.dart';
import '../../utils/dados/escalas/opcoes_npass_dor.dart';
import '../../utils/modelos/dados_bebe.dart';
import '../widgets/card_questionario.dart';
import '../intervencoes.dart';

class EscalaNPASSDor extends StatefulWidget {
  final DadosBebe dadosBebe;
  final int score;
  final String avaliacao;
  final List<Question> teste;

  EscalaNPASSDor({
    super.key,
    required this.dadosBebe,
    required this.score,
    required this.avaliacao,
    required this.teste,
  });

  @override
  State<EscalaNPASSDor> createState() => _EscalaNPASSDorState();
}

class _EscalaNPASSDorState extends State<EscalaNPASSDor> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Escala NPASS - Dor/Agitação')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (currentPage == opcoesDorNPASS.length - 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MetricaDorDoisValores(
                            dadosBebe: widget.dadosBebe,
                            teste: opcoesDorNPASS,
                            score: scoreTeste(opcoesDorNPASS),
                            scoreDois: widget.score,
                            avaliacaoDois: widget.avaliacao,
                            avaliacao:
                                avaliarSedacao(scoreTeste(opcoesDorNPASS)),
                          )));
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          label: Text(currentPage == opcoesDorNPASS.length - 1
              ? 'Prosseguir teste'
              : 'Próxima pergunta'),
        ),
        body: CardQuestionario(
          questions: opcoesDorNPASS,
          onSave: (updatedQuestions) {
            setState(() {
              opcoesDorNPASS = updatedQuestions;
            });
          },
          pageController: pageController,
          onPageChanged: (value) => setState(() => currentPage++),
        ));
  }
}
