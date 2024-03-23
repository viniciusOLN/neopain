import 'package:flutter/material.dart';

class CadastroCampoTexto extends StatelessWidget {
  final String texto;
  final Icon icone;
  final bool numeros;
  final Function(String?)? salvar;

  const CadastroCampoTexto(
      {super.key,
      required this.texto,
      required this.icone,
      this.numeros = false,
      required this.salvar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 7.0),
      child: TextFormField(
        decoration: InputDecoration(icon: icone, labelText: texto),
        onSaved: salvar,
        keyboardType: numeros ? TextInputType.number : null,
      ),
    );
  }
}
