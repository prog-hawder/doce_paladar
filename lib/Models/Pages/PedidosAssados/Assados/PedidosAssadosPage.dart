import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doce_paladar/Models/Pages/PedidosAssados/Assados/AssadosReaderScrean.dart';
import 'package:doce_paladar/Models/Pages/PedidosAssados/Assados/CreateAssados.dart';
import 'package:doce_paladar/Models/Pages/PedidosAssados/PedidosAssados.dart';
import 'package:flutter/material.dart';

import '../../../Pedidoscard.dart';

class PedidosAssadosPage extends StatefulWidget {
  const PedidosAssadosPage({Key? key, required this.pedidosDetalhes})
      : super(key: key);
  final PedidosAssado pedidosDetalhes;

  @override
  State<PedidosAssadosPage> createState() => _PedidosAssadosPageState();
}

class _PedidosAssadosPageState extends State<PedidosAssadosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                Text(widget.pedidosDetalhes.lojaName,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli')),
                Container(
                  width: 40,
                ),
              ],
            ),
          ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream:
                        FirebaseFirestore.instance.collection(widget.pedidosDetalhes.nomeBd).snapshots(),
                    builder: (context, AsyncSnapshot <QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                          children: snapshot.data!.docs
                              .map((pedido)=> PedidosCard((){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => 
                                      AssadosReaderScrean(pedido)));
                              }, pedido))
                              .toList(),
                        );
                      }
                      return Text("Não há Pedidos", style:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Muli'),);
                    },
                  ),
                )
          ]
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => 
                CreatePedidoAssados(loja: widget.pedidosDetalhes,)));
        }, 
        child:Icon(Icons.add,color: Colors.white,),
        backgroundColor:Colors.blue,  
        ),
    );
  }
}
