import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/telas/metrica_dor.dart';
import 'package:neonatal_pain_monitor/utils/modelos/dados_bebe.dart';
import 'package:neonatal_pain_monitor/utils/resultado/avaliar_dor.dart';
import '../../utils/dados/escalas/opcoes_nips.dart';
import '../../telas/widgets/card_questionario.dart';
import '../../telas/intervencoes.dart';
import '../../utils/resultado/calculo.dart';

class EscalaNIPS extends StatefulWidget {
  final DadosBebe dadosBebe;

  const EscalaNIPS({super.key, required this.dadosBebe});

  @override
  State<EscalaNIPS> createState() => _EscalaNIPSState();
}

class _EscalaNIPSState extends State<EscalaNIPS> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Escala NIPS')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (currentPage == opcoesNIPS.length - 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MetricaDor(
                            dadosBebe: widget.dadosBebe,
                            teste: opcoesNIPS,
                            score: scoreTeste(opcoesNIPS),
                            avaliacao: avaliarDorNips(scoreTeste(opcoesNIPS)),
                          )));
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          label: Text(currentPage == opcoesNIPS.length - 1
              ? 'Prosseguir teste'
              : 'Próxima pergunta'),
        ),
        body: CardQuestionario(
          questions: opcoesNIPS,
          onSave: (updatedQuestions) {
            setState(() {
              opcoesNIPS = updatedQuestions;
            });
          },
          pageController: pageController,
          onPageChanged: (value) => setState(() => currentPage++),
        ));
  }
}
