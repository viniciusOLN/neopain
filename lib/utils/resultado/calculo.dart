import '../modelos/pergunta.dart';

int scoreTeste(List<Question> teste) {
  List<int> respostas = teste
      .map((pergunta) => pergunta.options.indexOf(pergunta.selectedOption!))
      .toList();

  return respostas.reduce((value, element) => value + element);
}

int scoreTestNPasse(List<Question> teste) {
  List<int> respostas = teste
      .map((pergunta) => pergunta.options.indexOf(pergunta.selectedOption!))
      .toList();

  return respostas.reduce((value, element) => value + element);
}
