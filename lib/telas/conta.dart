import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/widgets/card_lista_intervencoes_nanda.dart';
import 'package:neonatal_pain_monitor/telas/widgets/descricao.dart';
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

class Conta extends StatefulWidget {
  Conta({
    Key? key,
  }) : super(key: key);

  @override
  State<Conta> createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  String nome = "";

  String coren = "";

  String cpf = "";

  String email = "";

  String senha = "";

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nome = prefs.getString('nome') ?? "";
      coren = prefs.getString('coren') ?? "";
      cpf = prefs.getString('cpf') ?? "";
      email = prefs.getString('email') ?? "";
      senha = prefs.getString('senha') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Rotulo(texto: 'Dados da conta:'),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Rotulo(texto: 'Nome'),
                        Descricao(texto: nome),
                        const Rotulo(texto: 'Nº Coren'),
                        Descricao(texto: coren),
                        const Rotulo(texto: 'CPF'),
                        Descricao(texto: cpf),
                        const Rotulo(texto: 'Email'),
                        Descricao(texto: email),
                        const Rotulo(texto: 'Senha'),
                        Descricao(texto: senha),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
