import 'package:flutter/material.dart';

class CadastroMenuSelecao extends StatefulWidget {
  final Icon icone;
  final String texto;
  final List<String> lista;
  final Function(String?)? salvar;

  const CadastroMenuSelecao(
      {super.key,
      required this.icone,
      required this.texto,
      required this.lista,
      required this.salvar});

  @override
  State<CadastroMenuSelecao> createState() => _CadastroMenuSelecaoState();
}

class _CadastroMenuSelecaoState extends State<CadastroMenuSelecao> {
  String escolhido = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(prefixIcon: widget.icone),
      isExpanded: true,
      hint: Text(widget.texto),
      onSaved: widget.salvar,
      onChanged: (String? value) {
        setState(() {
          escolhido = value!;
        });
      },
      items: widget.lista.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
