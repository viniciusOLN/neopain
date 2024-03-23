String avaliarDor(int score) {
  if (score >= 4) return 'Presença de dor.';

  if (score < 4) return 'Ausência de dor.';

  return 'Não foi possível avaliar';
}

String avaliarDorNips(int score) {
  if (score >= 3) return 'Presença de dor.';

  if (score < 3) return 'Ausência de dor.';

  return 'Não foi possível avaliar';
}
