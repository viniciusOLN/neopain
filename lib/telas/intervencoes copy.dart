import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/intervencoes.dart';
import 'package:neonatal_pain_monitor/telas/relatorio.dart';
import 'package:neonatal_pain_monitor/telas/widgets/intervencoes_checkbox%20copy.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/utils/modelos/dados_bebe.dart';
import 'package:neonatal_pain_monitor/utils/modelos/pergunta.dart';
import 'package:neonatal_pain_monitor/utils/resultado/calculo.dart';
import '../../utils/dados/intervencoes.dart';
import '../../utils/modelos/intervencao.dart';
import './widgets/intervencoes_checkbox.dart';

class IntervencoesNanda extends StatefulWidget {
  final DadosBebe dadosBebe;
  final int scoreTeste;
  final String avaliacao;
  final List<Question> teste;
  final int? scoreDois;
  final String? avaliacaoDois;

  const IntervencoesNanda(
      {super.key,
      required this.dadosBebe,
      required this.teste,
      required this.scoreTeste,
      required this.avaliacao,
      required this.scoreDois,
      required this.avaliacaoDois});

  static List<Intervencao> dados = DadosIntervencoesNanda.lista;
  @override
  State<IntervencoesNanda> createState() => _IntervencoesNandaState();
}

class _IntervencoesNandaState extends State<IntervencoesNanda> {
  final Map<int, bool> selecionadas = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
    8: false,
    9: false,
    10: false,
    11: false,
    12: false,
    13: false,
    14: false,
    15: false,
    16: false,
    17: false,
    18: false,
    19: false,
    20: false,
    21: false,
    22: false,
    23: false,
    24: false,
    25: false,
    26: false,
    27: false,
    28: false,
    29: false,
    30: false,
    31: false,
    32: false,
    33: false,
    34: false,
    35: false,
    36: false,
    37: false,
    38: false,
    39: false,
    40: false,
    41: false,
    42: false,
    43: false,
    44: false,
    45: false,
    46: false,
    47: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Diagnóstico de Enfermagem da NANDA',
              style: TextStyle(fontSize: 10),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Map<int, bool> nanda = {};
                  for (int i = 0; i < selecionadas.length; i++) {
                    if (selecionadas[i] == true) {
                      nanda[i] = true;
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Intervencoes(
                        dadosBebe: widget.dadosBebe,
                        teste: widget.teste,
                        scoreTeste: widget.scoreTeste,
                        avaliacao: widget.avaliacao,
                        scoreDois: widget.scoreDois,
                        avaliacaoDois: widget.avaliacaoDois,
                        nanda: nanda,
                      ),
                    ),
                  );
                },
                child: const Text('Prosseguir'),
              )
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            ...IntervencoesNanda.dados.map((intervencao) => Column(
                  children: [
                    IntervencoesCheckboxNanda(
                        intervencao: intervencao,
                        onChanged: (bool? value) => {
                              setState(() => selecionadas[IntervencoesNanda
                                  .dados
                                  .indexOf(intervencao)] = value!)
                            },
                        selecionadas: selecionadas),
                    const Divider(
                      height: 10,
                      thickness: 1,
                    )
                  ],
                ))
          ]),
        ));
  }
}
