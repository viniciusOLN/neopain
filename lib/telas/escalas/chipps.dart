import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/metrica_dor.dart';
import 'package:neonatal_pain_monitor/utils/modelos/dados_bebe.dart';
import 'package:neonatal_pain_monitor/utils/resultado/avaliar_dor.dart';
import '../../telas/widgets/card_questionario.dart';
import '../../utils/dados/escalas/opcoes_chipps.dart';
import '../../utils/resultado/calculo.dart';
import '../intervencoes.dart';

class EscalaCHIPPS extends StatefulWidget {
  final DadosBebe dadosBebe;

  const EscalaCHIPPS({super.key, required this.dadosBebe});

  @override
  State<EscalaCHIPPS> createState() => _EscalaCHIPPSState();
}

class _EscalaCHIPPSState extends State<EscalaCHIPPS> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escala CHIPPS')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (currentPage == opcoesCHIPPS.length - 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MetricaDor(
                          dadosBebe: widget.dadosBebe,
                          teste: opcoesCHIPPS,
                          score: scoreTeste(opcoesCHIPPS),
                          avaliacao: avaliarDor(scoreTeste(opcoesCHIPPS)),
                        )));
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        label: Text(currentPage == opcoesCHIPPS.length - 1
            ? 'Prosseguir teste'
            : 'Próxima pergunta'),
      ),
      body: CardQuestionario(
        questions: opcoesCHIPPS,
        onSave: (updatedQuestions) {
          setState(() {
            opcoesCHIPPS = updatedQuestions;
          });
        },
        pageController: pageController,
        onPageChanged: (value) => setState(() => currentPage++),
      ),
    );
  }
}
