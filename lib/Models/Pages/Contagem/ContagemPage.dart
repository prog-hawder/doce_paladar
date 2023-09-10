import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doce_paladar/Models/Pages/Contagem/Contagem/FazerContagem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Contagemcard.dart';
import '../../Pedidoscard.dart';
import 'Contagem/ContagemReaderScreen.dart';

class ContagemPage extends StatelessWidget {
  String day = DateFormat.d().format(DateTime.now()).toString();

  String daySem = DateFormat.E().format(DateTime.now()).toString();

  String date = DateFormat.Md().format(DateTime.now()).toString();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
          child: Column(children: [
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
                  Text("Contagem Camara Fria",
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Contagem")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: snapshot.data!.docs.map(
                          (contagem)=>ContagemCard((){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContagemReaderScreen
                                      (contagem)));
                              }, contagem))
                              .toList(),
                        );
                  }
                  return Text(
                    "Não há Contagem",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),
                  );
                },
              ),
            )
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FazerContagem()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

