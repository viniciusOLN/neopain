import 'package:neonatal_pain_monitor/utils/modelos/dados_bebe.dart';

class InfosEmail {
  String avaliacao;
  int scoreTeste;
  DadosBebe dadosBebe;
  List<String> intervencoes;
  List<String> nanda;
  final int scoreDois;
  final String avaliacaoDois;

  InfosEmail({
    required this.scoreDois,
    required this.avaliacaoDois,
    required this.avaliacao,
    required this.scoreTeste,
    required this.dadosBebe,
    required this.intervencoes,
    required this.nanda,
  });
}
