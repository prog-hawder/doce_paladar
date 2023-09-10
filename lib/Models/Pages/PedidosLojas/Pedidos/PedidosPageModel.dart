import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doce_paladar/Models/Pages/PedidosLojas/Pedidos/FazerPedido.dart';
import 'package:doce_paladar/Models/Pedidoscard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import '../PedidosLojas.dart';
import 'PedidoReaderScreen.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({Key? key, required this.pedidosDetails}) : super(key: key);
  final PedidosLoja pedidosDetails;
  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
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
                Text(widget.pedidosDetails.lojaName,
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
                        FirebaseFirestore.instance.collection(widget.pedidosDetails.nomeBd).snapshots(),
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
                                      PedidoReaderScreen(pedido)));
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
                CreatePedido(loja: widget.pedidosDetails,)));
        }, 
        child:Icon(Icons.add,color: Colors.white,),
        backgroundColor:Colors.blue,  
        ),
    );
  }
}
