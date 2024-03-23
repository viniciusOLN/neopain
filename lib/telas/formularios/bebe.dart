import 'package:flutter/material.dart';
import '/utils/modelos/dados_bebe.dart';
import '/telas/widgets/cadastro_campo_data.dart';
import '/telas/widgets/cadastro_campo_horario.dart';
import '/telas/widgets/cadastro_campo_texto.dart';
import '/telas/widgets/cadastro_menu_selecao.dart';
import '/telas/escalas/escolher.dart';

class CadastroBebe extends StatefulWidget {
  const CadastroBebe({super.key});

  @override
  State<CadastroBebe> createState() => _CadastroBebeState();
}

class _CadastroBebeState extends State<CadastroBebe> {
  final _formKey = GlobalKey<FormState>();
  DadosBebe dadosBebe = DadosBebe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicione um Neonato'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EscolhaEscala(dadosBebe: dadosBebe)));
          }
        },
        label: const Text('Escolher escala'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            CadastroCampoTexto(
                texto: 'Nome do Neonato',
                icone: const Icon(Icons.baby_changing_station_rounded),
                salvar: (String? value) {
                  dadosBebe.nomern = value!;
                }),
            CadastroCampoTexto(
                texto: 'Nome da mãe',
                icone: const Icon(Icons.person_2),
                salvar: (String? value) {
                  dadosBebe.nomemae = value!;
                }),
            CadastroCampoData(
                texto: 'Data de Nascimento',
                icone: const Icon(Icons.calendar_today),
                salvar: (String? value) {
                  dadosBebe.datanascimento = value!;
                }),
            CadastroCampoHorario(
                texto: 'Hora do nascimento',
                icone: const Icon(Icons.timer),
                salvar: (String? value) {
                  dadosBebe.horanascimento = value!;
                }),
            CadastroMenuSelecao(
                icone: const Icon(Icons.child_friendly),
                texto: 'Sexo',
                lista: const ['Masculino', 'Feminino'],
                salvar: (String? value) {
                  dadosBebe.sexo = value!;
                }),
            CadastroCampoTexto(
                texto: 'Idade Gestacional (em semanas)',
                icone: const Icon(Icons.calendar_view_week),
                numeros: true,
                salvar: (String? value) {
                  dadosBebe.gestacionalSemanas = value!;
                }),
            CadastroCampoTexto(
                texto: 'Idade Gestacional (em dias adicionais)',
                icone: const Icon(Icons.calendar_view_day),
                numeros: true,
                salvar: (String? value) {
                  dadosBebe.gestacionalDias = value!;
                }),
            CadastroCampoTexto(
                texto: 'Peso no nascimento (em gramas)',
                icone: const Icon(Icons.balance),
                numeros: true,
                salvar: (String? value) {
                  dadosBebe.pesoNascimento = value!;
                }),
            CadastroCampoTexto(
                texto: 'Peso atual (em gramas)',
                icone: const Icon(Icons.balance),
                numeros: true,
                salvar: (String? value) {
                  dadosBebe.pesoAtual = value!;
                }),
            CadastroCampoTexto(
                texto: 'Apgar no 1º minuto',
                icone: const Icon(Icons.score),
                numeros: true,
                salvar: (String? value) {
                  dadosBebe.apgar1minuto = value!;
                }),
            CadastroCampoTexto(
                texto: 'Apgar no 5º minuto',
                icone: const Icon(Icons.score),
                numeros: true,
                salvar: (String? value) {
                  dadosBebe.apgar5minuto = value!;
                }),
            CadastroCampoTexto(
                texto: 'Patologia materna',
                icone: const Icon(Icons.healing),
                salvar: (String? value) {
                  dadosBebe.patologiaMaterna = value!;
                }),
            CadastroCampoTexto(
                texto: 'Diagnóstico do RN',
                icone: const Icon(Icons.favorite),
                salvar: (String? value) {
                  dadosBebe.diagnosticoRN = value!;
                }),
            CadastroMenuSelecao(
                icone: const Icon(Icons.stroller),
                texto: 'Reanimação em sala de parto',
                lista: const ['Sim', 'Não'],
                salvar: (String? value) {
                  dadosBebe.reanimacaoParto = value!;
                }),
            CadastroMenuSelecao(
                icone: const Icon(Icons.airline_seat_flat),
                texto: 'Uso de surfactante exógeno',
                lista: const ['Sim', 'Não'],
                salvar: (String? value) {
                  dadosBebe.usoSurfactanteExogeno = value!;
                }),
            CadastroMenuSelecao(
                icone: const Icon(Icons.local_hospital),
                texto: 'Setor de internação',
                lista: const ['UTIN', 'UCINCo'],
                salvar: (String? value) {
                  dadosBebe.setorInternacao = value!;
                }),
          ],
        ),
      )),
    );
  }
}
