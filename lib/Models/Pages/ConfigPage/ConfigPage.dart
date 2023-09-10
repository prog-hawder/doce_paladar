import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../Services/auth_services.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final email = TextEditingController();
  final senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
     AuthService auth = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 18, 10, 0),
          child: Column(
            children: [
              SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      Text("Configurações",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Muli')),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              if(auth.usuario?.email== 'prog.hawder@gmail.com')
              Column(
                children: [
                  Padding(
            padding: const EdgeInsets.fromLTRB(38, 40, 38, 10),
            child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 2),
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
                      offset: Offset(0, 2),
                      blurRadius: 2.0,
                      spreadRadius: 1.4,
                    ),
                  ]),
              child: TextFormField(
                cursorColor: Colors.black,
                controller: senha,
                obscureText: false,
                decoration: InputDecoration(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 50, 90, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.black)))),
                    onPressed: (() async {
                       
      await context.read<AuthService>().registrar(email.text, senha.text);
    
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Criar nova conta",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),),],)
                  else
                  Text("Usuario não autorizado para criar novas contas",style: TextStyle(color: Colors.red),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 50, 90, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.red)))),
                    onPressed: (() async {
                      context.read<AuthService>().logout();
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Sair da conta",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),),
            ],
            
          ),
        ),
      ),
    );
  }
}