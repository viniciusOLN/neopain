import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroCampoData extends StatefulWidget {
  final String texto;
  final Icon icone;
  final Function(String?)? salvar;

  const CadastroCampoData(
      {super.key,
      required this.texto,
      required this.icone,
      required this.salvar});

  @override
  State<CadastroCampoData> createState() => _CadastroCampoDataState();
}

class _CadastroCampoDataState extends State<CadastroCampoData> {
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
            DateTime? dataEscolhida = await showDatePicker(
                helpText: 'Selecione a data',
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));

            if (dataEscolhida != null) {
              String dataFormatada =
                  DateFormat('yyyy-MM-dd').format(dataEscolhida);

              setState(() {
                controlador.text = dataFormatada;
              });
            }
          }),
    );
  }
}
