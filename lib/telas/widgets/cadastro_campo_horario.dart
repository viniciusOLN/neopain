import 'package:flutter/material.dart';

class CadastroCampoHorario extends StatefulWidget {
  final Icon icone;
  final String texto;
  final Function(String?)? salvar;

  const CadastroCampoHorario(
      {super.key,
      required this.texto,
      required this.icone,
      required this.salvar});

  @override
  State<CadastroCampoHorario> createState() => _CadastroCampoHorarioState();
}

class _CadastroCampoHorarioState extends State<CadastroCampoHorario> {
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 7.0),
      child: TextFormField(
        controller: controlador,
        decoration:
            InputDecoration(icon: widget.icone, labelText: widget.texto),
        readOnly: true,
        onSaved: widget.salvar,
        onTap: () async {
          TimeOfDay? horarioEscolhido = await showTimePicker(
            initialTime: TimeOfDay.now(),
            helpText: "Selecione o horário",
            context: context,
          );

          if (horarioEscolhido != null) {
            setState(() {
              controlador.text = horarioEscolhido.format(context);
            });
          }
        },
      ),
    );
  }
}
