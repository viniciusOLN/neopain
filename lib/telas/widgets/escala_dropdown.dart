import 'package:flutter/material.dart';

class EscalaDropdown extends StatefulWidget {
  final Icon icone;
  final String texto;
  final List<String> lista;
  final Function(String?)? salvar;

  const EscalaDropdown(
      {super.key,
      required this.icone,
      required this.texto,
      required this.lista,
      required this.salvar});

  @override
  State<EscalaDropdown> createState() => _EscalaDropdownState();
}

class _EscalaDropdownState extends State<EscalaDropdown> {
  String valor = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(prefixIcon: widget.icone),
      isExpanded: true,
      hint: Text(widget.texto),
      onSaved: widget.salvar,
      onChanged: (String? value) {
        setState(() {
          valor = value ?? widget.lista.first;
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
