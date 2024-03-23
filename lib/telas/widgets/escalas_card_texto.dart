import 'package:flutter/material.dart';

class CardTexto extends StatelessWidget {
  final String titulo;
  final String descricao;
  final Widget rota;

  const CardTexto({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.rota,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    descricao,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Escolher Escala'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => rota));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            )));
  }
}
