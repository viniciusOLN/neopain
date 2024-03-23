import '../../modelos/pergunta.dart';

List<Question> opcoesNIPS = [
  Question(
    questionText: 'Expressão Facial',
    options: ['Relaxada', 'Contraída'],
    image: [
      "assets/images/nips_relaxada.png",
      "assets/images/nips_contraida.png",
    ],
  ),
  Question(
    questionText: 'Choro',
    options: ['Ausente', 'Resmungos', 'Vigoroso'],
  ),
  Question(
    questionText: 'Respiração',
    options: ['Regular', 'Diferente da Basal'],
  ),
  Question(
    questionText: 'Braços',
    options: ['Relaxados', 'Fletidos ou Estendidos'],
  ),
  Question(
    questionText: 'Pernas',
    options: ['Relaxadas', 'Fletidas ou Estendidas'],
  ),
  Question(
    questionText: 'Estado de Consciência/alerta',
    options: [
      'Dormindo e/ou Calmo',
      'Agitado e/ou Irritado e/ou Desconfortável'
    ],
  ),
];
