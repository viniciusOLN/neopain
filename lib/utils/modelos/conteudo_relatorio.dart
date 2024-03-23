import 'dados_bebe.dart';

class ConteudoRelatorio {
  final DadosBebe dadosBebe;
  final int scoreTeste;
  final String avaliacao;
  final Map<int, bool> intervencoes;
  final Map<int, bool> intervencoesNanda;

  ConteudoRelatorio({
    required this.dadosBebe,
    required this.scoreTeste,
    required this.avaliacao,
    required this.intervencoes,
    required this.intervencoesNanda,
  });
}
