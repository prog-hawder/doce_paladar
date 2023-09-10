import 'package:doce_paladar/Models/Pages/Estoque/Estoque/SetoresEstoque.dart';
import 'package:flutter/material.dart';

class EstoquePage extends StatelessWidget {
  const EstoquePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Estoque> _EstoqueList = Estoque.Setores;
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
                  Text('Controle de estoque',
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
                    itemCount: _EstoqueList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SetoresEstoque(
                                        detalhes: _EstoqueList[index],
                                      ))));
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
                              child: Text(_EstoqueList[index].setorName,
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

class Estoque {
  late final int Id;
  final String setorName;
  final String nomeBd;
  Estoque({required this.setorName, required this.Id, required this.nomeBd});
  static List<Estoque> Setores = [
    Estoque(Id: 0, setorName: 'Estoque Total', nomeBd: 'Estoque total'),
    Estoque(Id: 1, setorName: 'Saidas', nomeBd: 'Saidas'),
    Estoque(Id: 2, setorName: 'Entradas', nomeBd: 'Entradas'),
    Estoque(Id: 3, setorName: 'Fornecedores', nomeBd: 'Fornecedores'),
    Estoque(Id: 4, setorName: 'Relatorios', nomeBd: 'Relatorios'),
  ];
}
