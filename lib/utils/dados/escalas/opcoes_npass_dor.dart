import '../../modelos/pergunta.dart';

List<Question> opcoesDorNPASS = [
  Question(
    questionText: 'Irritabilidade/Choro',
    options: [
      'Ausência de sinais de dor/agitação',
      'Irritadiço ou episódios de choro, consolável',
      'Choro agudo ou silencioso contínuo, não é consolável'
    ],
  ),
  Question(
    questionText: 'Estado Comportamental',
    options: [
      'Ausência de sinais de dor/agitação',
      'Inquieto, se contorce. Acorda com frequência',
      'Arqueia o corpo, fica chutando. Acordado constante ou não acorda nem se move (não está sedado)'
    ],
  ),
  Question(
    questionText: 'Expressão Facial',
    options: [
      'Ausência de sinais de dor/agitação',
      'Qualquer expressão de dor intermitente',
      'Qualquer expressão de dor contínua'
    ],
    image: [
      "",
      'assets/images/n_pass_intermitente.png',
      'assets/images/n_pass_continua.png',
    ],
  ),
  Question(
    questionText: 'Tonus Membros',
    options: [
      'Ausência de sinais de dor/agitação',
      'Mãos cerradas ou espalmadas de forma intermitente (< 30 s de duração), tônus corporal relaxado',
      'Mãos cerradas ou espalmadas de forma intermitente (> 30 s de duração) ou corpo está tenso/rígido.'
    ],
  ),
  Question(
    questionText: 'Sinais Vitais: FC, PA, FR e Saturação O2',
    options: [
      'Ausência de sinais de dor/agitação',
      'Aumento de 10-20% em relação ao basal, satO2 76- 85% com estímulo; rápida recuperação (< 2 minutos)',
      'Aumento de 20% em relação ao basal; SatO2 menor que 75% com estímulo, lenta recuperação (> 2 minutos), sem sincronia (briga) com o ventilador'
    ],
  ),
];
