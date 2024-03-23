import 'package:flutter/material.dart';
import '../../utils/modelos/dados_bebe.dart';
import '../widgets/escalas_card_texto.dart';
import '../../telas/escalas/npass.dart';
import '../../telas/escalas/npass_dor.dart';
import '../../telas/escalas/nips.dart';
import '../../telas/escalas/chipps.dart';

class EscolhaEscala extends StatelessWidget {
  final DadosBebe dadosBebe;

  const EscolhaEscala({super.key, required this.dadosBebe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolher escala')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64.0),
          child: Column(
            children: [
              Center(
                  child: CardTexto(
                      titulo: 'Escala NIPS (Neonatal Infant Pain Scale)',
                      descricao:
                          'Escala multidimensional que avalia recém-nascido a termo e prematuro composta por cinco parâmetros comportamentais e um indicador fisiológico, incluindo a expressão facial, choro, movimentação de braços e pernas, estado de sono/alerta e o padrão respiratório, avaliados antes, durante e após procedimentos invasivos agudos.',
                      rota: EscalaNIPS(dadosBebe: dadosBebe))),
              Center(
                child: CardTexto(
                    titulo:
                        'Escala CHIPPS (Children’s and Infants Postoperative Pain Scale)',
                    descricao:
                        'Escala comportamental, utilizada para Avaliação de Dor no Pós-cirúrgico em recém-nascidos a termo, prematuros e crianças. Ela é constituída por cinco itens: choro, expressão fácil, postura do tronco, postura das pernas e inquietude motora.',
                    rota: EscalaCHIPPS(dadosBebe: dadosBebe)),
              ),
              Center(
                  child: CardTexto(
                      titulo:
                          'Escala N-PASS – (Neonatal Pain Agitation and Sedation Scale)',
                      descricao:
                          'Desenvolvida para avaliar dor aguda e prolongada e sedação em recém-nascido a termo, prematuro e crianças gravemente doentes. É composta por duas medidas de escore: dor/agitação e sedação e, em cada uma, cinco critérios são avaliados: choro/irritabilidade; estado comportamental; expressão facial; tônus das extremidades e sinais vitais.',
                      rota: EscalaNPASS(dadosBebe: dadosBebe))),
              // Center(
              //     child: CardTexto(
              //         titulo:
              //             'Escala N-PASS (Dor) – (Neonatal Pain Agitation and Sedation Scale)',
              //         descricao:
              //             'Desenvolvida para avaliar dor aguda e prolongada (crônica e/ou contínua) em recém-nascido a termo, prematuro e crianças gravemente doentes.',
              //         rota: EscalaNPASSDor(dadosBebe: dadosBebe))),
            ],
          ),
        ),
      ),
    );
  }
}
