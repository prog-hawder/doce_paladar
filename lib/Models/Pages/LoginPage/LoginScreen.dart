import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final senha = TextEditingController();
  bool loading = false;
  bool _isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(children: [
        SizedBox(
          height: 80,
        ),
        Text("Login",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Muli')),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(38, 30, 38, 50),
          child: Container(
              child: Image.network(
                  "https://docepaladar.com.br/wp-content/uploads/2021/05/cropped-Path-199.png")),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(38, 20, 38, 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 4),
                    blurRadius: 2.0,
                    spreadRadius: 1.4,
                  ),
                ]),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: email,
              decoration: InputDecoration(
                prefixStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(36)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(36)),
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Informe o email corretament!";
                }
                return null;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(38, 20, 38, 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 4),
                    blurRadius: 2.0,
                    spreadRadius: 1.4,
                  ),
                ]),
            child: TextFormField(
              
              cursorColor: Colors.black,
              controller: senha,
              obscureText: _isobscure,
              decoration: InputDecoration(
                
                suffixIcon: IconButton(
                  padding: EdgeInsetsDirectional.only(end: 20),
                  icon: _isobscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isobscure = !_isobscure;
                    });
                  },
                ),
                prefixStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(36)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(36)),
                labelText: "Senha",
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Informe sua senha!';
                } else if (value.length < 6) {
                  return 'Sua senha deve ter no mínimo 6 digitos';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(90, 30, 90, 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 4),
                    blurRadius: 2.0,
                    spreadRadius: 1.4,
                  ),
                ]),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)))),
              onPressed: (() async {
                try {
                  await context.read<AuthService>().login(email.text, senha.text);
                } on AuthException catch (e) {
                  setState(() => loading = false);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.message)));
                }
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    )));
  }
}
