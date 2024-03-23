import 'package:flutter/material.dart';

class RelatorioCard extends StatelessWidget {
  final String? nome;
  final String? avaliacao;
  final void Function()? onTap;

  const RelatorioCard(
      {super.key, this.nome, this.avaliacao, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
          child: ListTile(
        leading: const Icon(Icons.description),
        title: Text(nome ?? 'Indefinido'),
        subtitle: Text(avaliacao ?? 'Indefinido'),
        onTap: onTap,
      )),
    );
  }
}
