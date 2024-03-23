class Question {
  final String questionText;
  final List<String> options;
  String? selectedOption;
  List<String>? image;

  Question({required this.questionText, required this.options, this.image});
}
