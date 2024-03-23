import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/relatorio.dart';
import 'package:neonatal_pain_monitor/utils/modelos/dados_bebe.dart';
import 'package:neonatal_pain_monitor/utils/modelos/pergunta.dart';
import '../../utils/dados/intervencoes.dart';
import '../../utils/modelos/intervencao.dart';
import './widgets/intervencoes_checkbox.dart';

class Intervencoes extends StatefulWidget {
  final DadosBebe dadosBebe;
  final int scoreTeste;
  final String avaliacao;
  final List<Question> teste;
  final Map<int, bool> nanda;
  final int? scoreDois;
  final String? avaliacaoDois;

  const Intervencoes({
    super.key,
    required this.dadosBebe,
    required this.teste,
    required this.scoreTeste,
    required this.avaliacao,
    required this.nanda,
    required this.scoreDois,
    required this.avaliacaoDois,
  });

  static List<Intervencao> dados = DadosIntervencoes.lista;

  @override
  State<Intervencoes> createState() => _IntervencoesState();
}

class _IntervencoesState extends State<Intervencoes> {
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
    14: false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Intervenções Não Farmacológicas',
              style: TextStyle(fontSize: 10),
            ),
            actions: [
              TextButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Relatorio(
                        dadosBebe: widget.dadosBebe,
                        scoreTeste: widget.scoreTeste,
                        avaliacao: widget.avaliacao,
                        scoreDois: widget.scoreDois,
                        avaliacaoDois: widget.avaliacaoDois,
                        intervencoes: selecionadas,
                        nanda: widget.nanda,
                      ),
                    ),
                  ),
                },
                child: const Text('Prosseguir'),
              )
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            ...Intervencoes.dados.map((intervencao) => Column(
                  children: [
                    IntervencoesCheckbox(
                        intervencao: intervencao,
                        onChanged: (bool? value) => {
                              setState(() => selecionadas[Intervencoes.dados
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
