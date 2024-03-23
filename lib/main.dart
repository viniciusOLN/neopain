import 'package:flutter/material.dart';
import 'package:neonatal_pain_monitor/telas/conta.dart';
import 'package:neonatal_pain_monitor/telas/login.dart';
import 'package:neonatal_pain_monitor/utils/modelos/conteudo_relatorio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './telas/formularios/bebe.dart';
import './telas/relatorios.dart';
import './utils/dados/sobre.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString("email");
  runApp(
    MaterialApp(
      theme:
          ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purpleAccent),
      title: 'NeoPain',
      home: SafeArea(
        child: (email != null) ? MainApp() : LoginPage(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  final List<ConteudoRelatorio>? relatorios;

  const MainApp({super.key, this.relatorios});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void initState() {
    super.initState();
    if (widget.relatorios == null) {
      print(widget.relatorios);
      Future.delayed(Duration.zero, () {
        showDialog(
            context: context,
            //context: _scaffoldKey.currentContext,
            builder: (context) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Prosseguir"))
                ],
                contentPadding: EdgeInsets.only(left: 25, right: 25),
                title: Center(child: Text("SOBRE O APP")),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Container(
                  height: 400,
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          sobre,
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeoPain'),
      ),
      body: Relatorios(relatorios: widget.relatorios),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.description),
          //   label: 'Relatórios',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.baby_changing_station),
            label: 'Adicionar Neonato',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Dados',
          ),
        ],
        onTap: (index) => {
          if (index == 0)
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroBebe(),
                  ))
            }
          else if (index == 1)
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Conta(),
                  ))
            }
        },
      ),
    );
  }
}
