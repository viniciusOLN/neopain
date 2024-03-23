import '../../modelos/pergunta.dart';

List<Question> opcoesNPASS = [
  Question(
    questionText: 'Irritabilidade/Choro',
    options: [
      'Ausência de sinais de sedação',
      'Resmunga/gemidos/chora com estímulo doloroso',
      'Não chora ou responde ao estímulo doloroso'
    ],
  ),
  Question(
    questionText: 'Estado Comportamental',
    options: [
      'Ausência de sinais de sedação',
      'Acorda breve com estímulo, raro movimento espontâneo',
      'Não desperta ou não reage com estímulo, sem movimentos espontâneos',
    ],
  ),
  Question(
    questionText: 'Expressão Facial',
    options: [
      'Ausência de sinais de sedação',
      'Mínima expressão facial com estímulo',
      'Boca relaxada, babando ou ausência de expressão facial',
    ],
    image: [
      '',
      'assets/images/n_pass_estimulo.png',
      'assets/images/n_pass_relaxada.png',
    ],
  ),
  Question(
    questionText: 'Tonus Membros',
    options: [
      'Ausência de sinais de sedação',
      'Preensão palmar ou plantar fraca e/ou tônus diminuído',
      'Ausência da preensão palmar ou plantar e/ou flacidez'
    ],
  ),
  Question(
    questionText: 'Sinais Vitais: FC, PA, FR e Saturação O2',
    options: [
      'Ausência de sinais de sedação',
      'Alteração menor que 10% com estímulo',
      'Sem alteração após estímulo, hipoventilação ou apneias',
    ],
  ),
];
