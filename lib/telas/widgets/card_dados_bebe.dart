import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/utils/modelos/dados_bebe.dart';
import 'rotulo.dart';
import 'descricao.dart';

class CardDadosBebe extends StatelessWidget {
  final DadosBebe dadosBebe;

  const CardDadosBebe({
    super.key,
    required this.dadosBebe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Rotulo(texto: 'Nome do RN:'),
              Descricao(texto: dadosBebe.nomern!),
              const Rotulo(texto: 'Nome da mãe:'),
              Descricao(texto: dadosBebe.nomemae!),
              const Rotulo(texto: 'Data de nascimento:'),
              Descricao(texto: dadosBebe.datanascimento!),
              const Rotulo(texto: 'Hora do nascimento:'),
              Descricao(texto: dadosBebe.horanascimento!),
              const Rotulo(texto: 'Sexo:'),
              Descricao(texto: dadosBebe.sexo!),
              const Rotulo(texto: 'Idade gestacional em semanas:'),
              Descricao(texto: dadosBebe.gestacionalSemanas!),
              const Rotulo(texto: 'Idade gestacional em dias:'),
              Descricao(texto: dadosBebe.gestacionalDias!),
              const Rotulo(texto: 'Peso no nascimento (em gramas):'),
              Descricao(texto: dadosBebe.pesoNascimento!),
              const Rotulo(texto: 'Peso atual (em gramas):'),
              Descricao(texto: dadosBebe.pesoAtual!),
              const Rotulo(texto: 'APGAR no 1º minuto:'),
              Descricao(texto: dadosBebe.apgar1minuto!),
              const Rotulo(texto: 'Apgar no 5º minuto:'),
              Descricao(texto: dadosBebe.apgar5minuto!),
              const Rotulo(texto: 'Patologia Materna:'),
              Descricao(texto: dadosBebe.patologiaMaterna!),
              const Rotulo(texto: 'Diagnóstico do RN:'),
              Descricao(texto: dadosBebe.diagnosticoRN!),
              const Rotulo(texto: 'Reanimação no parto:'),
              Descricao(texto: dadosBebe.reanimacaoParto!),
              const Rotulo(texto: 'Uso de surfactante exógeno:'),
              Descricao(texto: dadosBebe.usoSurfactanteExogeno!),
              const Rotulo(texto: 'Setor de internação:'),
              Descricao(texto: dadosBebe.setorInternacao!)
            ],
          ),
        ),
      ),
    );
  }
}
