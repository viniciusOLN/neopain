import '../../modelos/pergunta.dart';

List<Question> opcoesCHIPPS = [
  Question(
    questionText: 'Choro',
    options: ['Nenhum', 'Gemido', 'Grito'],
  ),
  Question(
    questionText: 'Expressão Facial',
    options: ['Relaxado/sorrindo', 'Boca retorcida', 'Careta (olhos/boca)'],
    image: [
      'assets/images/chips_relaxada.png',
      'assets/images/chips_retorcida.png',
      'assets/images/chips_careta.png',
    ],
  ),
  Question(
    questionText: 'Postura do Tronco',
    options: ['Neutra', 'Variável', 'Arqueada para trás'],
  ),
  Question(
    questionText: 'Postura das Pernas',
    options: ['Neutra/solta', 'Chutando', 'Pernas tencionadas'],
  ),
  Question(
    questionText: 'Inquietação Motora',
    options: ['Nenhum', 'Moderada', 'Inquietação'],
  ),
];
