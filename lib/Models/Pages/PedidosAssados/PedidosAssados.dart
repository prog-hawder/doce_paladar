import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'Assados/PedidosAssadosPage.dart';

class PedidosAssados extends StatelessWidget {
  const PedidosAssados({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<PedidosAssado> _LojasAssados = PedidosAssado.Lojas;
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
                  Text('Pedido Assados',
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
                    itemCount: _LojasAssados.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) =>
                            PedidosAssadosPage(
                              pedidosDetalhes: _LojasAssados[index],
                            )
                          )));
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
                              child: Text(_LojasAssados[index].lojaName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'Muli')),
                            ),
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}

class PedidosAssado {
  late final int lojaId;
  final String lojaName;
  final String nomeBd;
  PedidosAssado(
      {required this.lojaName, required this.lojaId, required this.nomeBd});
  static List<PedidosAssado> Lojas = [
    PedidosAssado(lojaId: 0, lojaName: 'Loja 1', nomeBd: 'Loja1 Assados'),
    PedidosAssado(lojaId: 1, lojaName: 'Loja 2', nomeBd: 'Loja2 Assados'),
    PedidosAssado(lojaId: 2, lojaName: 'Loja 5', nomeBd: 'Loja5 Assados'),
    PedidosAssado(lojaId: 3, lojaName: 'Havan', nomeBd: 'Havan Assados'),
  ];
}
