import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neonatal_pain_monitor/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController coren = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmarEmail = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmarSenha = TextEditingController();
  bool isHiddenPassword = true;

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome.text);
    await prefs.setString('coren', coren.text);
    await prefs.setString('cpf', cpf.text);
    await prefs.setString('email', email.text);
    await prefs.setString('senha', senha.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          color: Color.fromARGB(255, 220, 220, 220),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/logo_app.png",
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                Center(
                  child: Text("NEOPAIN"),
                ),
                const SizedBox(
                  height: 40,
                ),
                // const Text(
                //   "Nome",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: nome,
                  decoration: const InputDecoration(
                    label: Text("Nome"),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 254, 254),
                    hoverColor: Color.fromARGB(80, 251, 251, 251),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   "Nº do Coren",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: coren,
                  decoration: const InputDecoration(
                    label: Text("Nº do Coren"),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 254, 254),
                    hoverColor: Color.fromARGB(80, 251, 251, 251),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o Número do Coren';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   "CPF (somente números)",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: cpf,
                  inputFormatters: [
                    // obrigatório
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    label: Text("CPF (somente números)"),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 254, 254),
                    hoverColor: Color.fromARGB(80, 251, 251, 251),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite seu CPF';
                    } else if (value.length != 14) {
                      return 'CPF inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   "E-mail",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: email,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text("E-mail"),
                    fillColor: Color.fromARGB(198, 255, 254, 254),
                    hoverColor: Color.fromARGB(80, 251, 251, 251),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite seu e-mail';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   "Confirmar E-mail",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Text(
                //   "Senha",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  obscureText: isHiddenPassword,
                  controller: senha,
                  decoration: const InputDecoration(
                    label: Text("Senha"),
                    filled: true,
                    fillColor: Color.fromARGB(198, 255, 254, 254),
                    hoverColor: Color.fromARGB(80, 251, 251, 251),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(fontSize: 20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite sua senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text(
                //   "Confirmar Senha",
                //   style: TextStyle(
                //     color: Colors.black87,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "LOGIN",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          saveData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainApp(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
