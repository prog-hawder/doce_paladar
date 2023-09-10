import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Pedidos/PedidosPageModel.dart';

class PedidosLojas extends StatelessWidget {
  const PedidosLojas({super.key});

  @override
  Widget build(BuildContext context) {
    List<PedidosLoja> _LojasList = PedidosLoja.Lojas;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
        child: Column(
          
          children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Text('Pedido Congelados',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli')),
                Container(
                  width: 40,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _LojasList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => PedidosPage(
                                pedidosDetails: _LojasList[index]))));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 3.0,
                              spreadRadius: 1.4,
                            ), //BoxShadow
                          ]),
                      child: Center(
                        child: Text(_LojasList[index].lojaName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'Muli')),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ]),
      ),
    );
  }
}

class PedidosLoja {
  late final int lojaId;
  final String lojaName;
  final String nomeBd;
  PedidosLoja({required this.lojaName, required this.lojaId, required this.nomeBd});
  static List<PedidosLoja> Lojas = [
    PedidosLoja(lojaId: 0, lojaName: 'Loja 1', nomeBd:'Loja1 Pedidos' ),
    PedidosLoja(lojaId: 1, lojaName: 'Loja 2', nomeBd:'Loja2 Pedidos'),
    PedidosLoja(lojaId: 2, lojaName: 'Loja 5', nomeBd:'Loja5 Pedidos'),
    PedidosLoja(lojaId: 3, lojaName: 'Havan', nomeBd:'Havan Pedidos'),
    PedidosLoja(lojaId: 5, lojaName: 'Coxinha BPS', nomeBd:'Coxinha Bps'),
    PedidosLoja(lojaId: 6, lojaName: 'Coxinha AS', nomeBd:'Coxinha AS'),
  ];
}
