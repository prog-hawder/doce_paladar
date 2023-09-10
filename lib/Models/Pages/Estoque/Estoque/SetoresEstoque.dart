import 'package:doce_paladar/Models/Pages/Estoque/EstoquePage.dart';
import 'package:flutter/material.dart';

class SetoresEstoque extends StatefulWidget {
  const SetoresEstoque({Key? key, required this.detalhes}) : super(key: key);
  final Estoque detalhes;

  @override
  State<SetoresEstoque> createState() => _SetoresEstoqueState();
}

class _SetoresEstoqueState extends State<SetoresEstoque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
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
                    Text(widget.detalhes.setorName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Muli')),
                    Container(
                      width: 40,
                    ),
                    //Estoque Total
                    if (widget.detalhes.Id == 0)
                      Expanded(
                          child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0, 2),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.4,
                                    ), //BoxShadow
                                  ]),
                              child: Column(
                                children: [
                                  
                                ],
                              ),
                            ),
                          );
                        },
                      ))
                    //saidas
                    else if (widget.detalhes.Id == 1)
                      Expanded(child: Container())
                    else if (widget.detalhes.Id == 2)
                      //entradas
                      Expanded(child: Container())
                    else if (widget.detalhes.Id == 3)
                      //fornecedores
                      Expanded(child: Container())
                    else if (widget.detalhes.Id == 4)
                      //relatorios
                      Expanded(child: Container())
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
