import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/escalas/npass_dor.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/telas/metrica_dor.dart';
import '../../telas/widgets/card_questionario.dart';
import '../../utils/dados/escalas/opcoes_npass.dart';
import '../../utils/modelos/dados_bebe.dart';
import '../../utils/resultado/avaliar_sedacao.dart';
import '../../utils/resultado/calculo.dart';
import '../intervencoes.dart';

class EscalaNPASS extends StatefulWidget {
  final DadosBebe dadosBebe;

  const EscalaNPASS({super.key, required this.dadosBebe});

  @override
  State<EscalaNPASS> createState() => _EscalaNPASSState();
}

class _EscalaNPASSState extends State<EscalaNPASS> {
  PageController pageController = PageController();
  int currentPage = 0;
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala NPASS - Sedação')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (currentPage == opcoesNPASS.length - 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EscalaNPASSDor(
                          dadosBebe: widget.dadosBebe,
                          teste: opcoesNPASS,
                          score: scoreTestNPasse(opcoesNPASS),
                          avaliacao:
                              avaliarSedacaoNPass(scoreTestNPasse(opcoesNPASS)),
                        )));
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        label: Text(currentPage == opcoesNPASS.length - 1
            ? 'Prosseguir teste'
            : 'Próxima pergunta'),
      ),
      body: CardQuestionario(
        questions: opcoesNPASS,
        onSave: (updatedQuestions) {
          setState(() {
            opcoesNPASS = updatedQuestions;
          });
        },
        pageController: pageController,
        onPageChanged: (value) => setState(() => currentPage++),
      ),
    );
  }
}
