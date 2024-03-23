import 'package:flutter/material.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

import 'infos_email.dart';
import 'secret_key.dart';

class EmailSender {
  String toAddress;
  List<Content> contents;
  final String _fromAddress = "neopainapp@hotmail.com";
  String subject = "Prontuário Aplicativo";

  EmailSender({
    required this.toAddress,
    required this.contents,
    required this.subject,
  });

  bool sendEmail(BuildContext context) {
    final mailer = Mailer(SECRET_KEY);
    final toAddress = Address(this.toAddress);
    final fromAddress = Address(_fromAddress);
    final personalization = Personalization([toAddress]);

    final email = Email(
      [personalization],
      fromAddress,
      subject,
      content: contents,
    );

    bool emailSuccess = false;

    mailer.send(email).then((result) {
      emailSuccess = result.isValue;
      if (emailSuccess) {
        const snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: SizedBox(
            height: 50,
            child: Text('Email enviado com sucesso.'),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: SizedBox(
            height: 50,
            child: Text('Erro ao enviar o email.'),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }).onError((error, stackTrace) {
      print(error);
    });

    return emailSuccess;
  }

  static String getInterventions(List infos) {
    String interventions = "";
    for (int i = 0; i < infos.length; i++) {
      interventions += infos[i] + "<br>";
    }

    return interventions;
  }

  static String templateEmail(InfosEmail infos) {
    String interventions = getInterventions(infos.intervencoes);
    String interventionsNanda = getInterventions(infos.nanda);
    return "<b>Avaliação da dor:</b><br><br>"
        "   ${infos.avaliacao}<br>"
        "   Score Teste: ${infos.scoreTeste}<br>"
        "<b>Avaliação N-Pass:</b><br><br>"
        "   ${infos.avaliacaoDois}<br>"
        "   Score Teste: ${infos.avaliacaoDois}<br>"
        "Dados do Neonato ${infos.dadosBebe.nomern}:<br> "
        "<b>Nome da mãe:</b> ${infos.dadosBebe.nomemae}<br><br>"
        "<b>Data de nascimento:</b> ${infos.dadosBebe.datanascimento}<br><br>"
        "<b>Hora de nascimento:</b> ${infos.dadosBebe.horanascimento}<br><br>"
        "<b>Sexo:</b> ${infos.dadosBebe.sexo}<br><br>"
        "<b>Semanas gestacionais:</b> ${infos.dadosBebe.gestacionalSemanas}<br><br>"
        "<b>Dias gestacionais:</b> ${infos.dadosBebe.gestacionalDias}<br><br>"
        "<b>Peso durante nascimento:</b> ${infos.dadosBebe.pesoNascimento}<br><br>"
        "<b>Peso atual:</b> ${infos.dadosBebe.pesoAtual}<br><br>"
        "<b>apgar 1 minuto:</b> ${infos.dadosBebe.apgar1minuto}<br><br>"
        "<b>apgar 5 minutos:</b> ${infos.dadosBebe.apgar5minuto}<br><br>"
        "<b>Patologia Materna:</b> ${infos.dadosBebe.patologiaMaterna}<br><br>"
        "<b>Diagnóstico RN:</b> ${infos.dadosBebe.diagnosticoRN}<br><br>"
        "<b>Reanimação em parto:</b> ${infos.dadosBebe.reanimacaoParto}<br><br>"
        "<b>Uso de Surfactante Exogeno:</b> ${infos.dadosBebe.usoSurfactanteExogeno}<br><br>"
        "<b>Setor de internação:</b> ${infos.dadosBebe.setorInternacao}<br><br>"
        "<b>Intervenções não farmacológicas recomendadas para prevenção, alívio e manejo da dor:</b><br><br>"
        "    $interventions<br>"
        "<b>Diagnósticos de Enfermagem da Nanda:</b><br><br>"
        "    $interventionsNanda<br>";
  }
}
