import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/widgets/card_lista_intervencoes_nanda.dart';
import 'package:neonatal_pain_monitor/telas/widgets/rotulo.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes%20copy.dart';
import 'package:neonatal_pain_monitor/utils/dados/intervencoes.dart';
import 'package:neonatal_pain_monitor/utils/email_sender.dart';
import 'package:neonatal_pain_monitor/utils/infos_email.dart';
import 'package:neonatal_pain_monitor/utils/modelos/conteudo_relatorio.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../telas/widgets/card_lista_intervencoes.dart';
import '../utils/modelos/dados_bebe.dart';
import 'widgets/card_avaliacao.dart';
import 'widgets/card_dados_bebe.dart';

class Relatorio extends StatelessWidget {
  final DadosBebe dadosBebe;
  final int scoreTeste;
  final String avaliacao;
  final Map<int, bool> intervencoes;
  final Map<int, bool> nanda;
  final int? scoreDois;
  final String? avaliacaoDois;

  const Relatorio({
    Key? key,
    required this.dadosBebe,
    required this.scoreTeste,
    required this.avaliacao,
    required this.intervencoes,
    required this.nanda,
    this.scoreDois,
    this.avaliacaoDois,
  }) : super(key: key);

  void sendEmail(InfosEmail infos, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email") ?? "";
    EmailSender emailSender = EmailSender(
      subject: "Prontuário Aplicativo",
      toAddress: email,
      contents: [
        Content(
          "text/html",
          EmailSender.templateEmail(infos),
        ),
      ],
    );

    bool successEmail = emailSender.sendEmail(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Resultado do Teste'), actions: [
          TextButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainApp(relatorios: [
                            ConteudoRelatorio(
                              dadosBebe: dadosBebe,
                              scoreTeste: scoreTeste,
                              avaliacao: avaliacao,
                              intervencoes: intervencoes,
                              intervencoesNanda: nanda,
                            ),
                          ]),
                        ))
                  },
              child: const Text('Voltar ao início')),
          TextButton(
              onPressed: () {
                List<String> intervencoesString = [];
                List<String> intervencoesNanda = [];
                intervencoes.entries
                    .where((entry) => entry.value)
                    .map((entry) => intervencoesString.add(
                          DadosIntervencoes.lista[entry.key].nome,
                        ))
                    .toList();
                nanda.entries
                    .where((entry) => entry.value)
                    .map((entry) => intervencoesNanda.add(
                          DadosIntervencoesNanda.lista[entry.key].nome,
                        ))
                    .toList();
                bool isNull = false;
                if (avaliacaoDois == null) {
                  isNull = true;
                }
                InfosEmail infos = InfosEmail(
                  avaliacaoDois: isNull ? "Sem avaliação" : avaliacaoDois!,
                  scoreDois: isNull ? 0 : scoreDois!,
                  avaliacao: avaliacao,
                  scoreTeste: scoreTeste,
                  dadosBebe: dadosBebe,
                  intervencoes: intervencoesString,
                  nanda: intervencoesNanda,
                );
                sendEmail(infos, context);
              },
              child: const Text('Enviar para Email'))
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
                  scoreTeste: scoreTeste,
                ),
                (avaliacaoDois != null)
                    ? CardAvaliacao(
                        avaliacao: avaliacaoDois!,
                        scoreTeste: scoreDois! * -1,
                      )
                    : Container(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Rotulo(texto: 'Dados do Neonato:'),
                ),
                CardDadosBebe(
                  dadosBebe: dadosBebe,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Rotulo(
                      texto:
                          'Intervenções não farmacológicas recomendadas para prevenção, alívio e manejo da dor:'),
                ),
                CardListaIntervencoes(
                  intervencoes: intervencoes,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Rotulo(texto: 'Diagnósticos de Enfermagem da Nanda:'),
                ),
                CardListaIntervencoesNanda(
                  intervencoes: nanda,
                ),
              ],
            ),
          ),
        ));
  }
}
