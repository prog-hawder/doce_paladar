import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doce_paladar/Models/Listas/Listas.dart';
import 'package:doce_paladar/Models/Pages/PedidosAssados/PedidosAssados.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class CreatePedidoAssados extends StatefulWidget {
  PedidosAssado loja;
  CreatePedidoAssados({super.key, required this.loja});

  @override
  State<CreatePedidoAssados> createState() => _CreatePedidoAssadosState();
}

class _CreatePedidoAssadosState extends State<CreatePedidoAssados> {
  DateTime? _dateTime = null;
  List<Salgadoassado> _SalgadoList = Salgadoassado.SalgadoList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
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
                 TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2026))
                          .then((date) async {
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                    child: Text( _dateTime == null? " selecione a data do pedido ":
                        DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                            .format(_dateTime!),
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Muli')),
                  ),
                  Container(
                    width: 30,
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _SalgadoList.length,
                    itemBuilder: ((context, index) {
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
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(17.0),
                                          topRight: Radius.circular(17.0)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              _SalgadoList[index].salgadoImg),
                                          fit: BoxFit.cover),
                                    ),
                                    child: null,
                                  )),
                              Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                _SalgadoList[index].salgadoName,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    fontFamily: 'Muli')),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 39,
                                                width: 109,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            36),
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    color: Colors.white),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(36),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.black,
                                                              offset:
                                                                  Offset(0, 0),
                                                              blurRadius: 2.0,
                                                              spreadRadius: 1.6,
                                                            ), //BoxShadow
                                                          ],
                                                          color:
                                                              Colors.grey[400]),
                                                      child: Center(
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              if (_SalgadoList[
                                                                          index]
                                                                      .quantidade >
                                                                  0) {
                                                                setState(() {
                                                                  _SalgadoList[
                                                                          index]
                                                                      .quantidade--;
                                                                });
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(8, 0, 8, 0),
                                                      child: Center(
                                                        child: Text(
                                                            _SalgadoList[index]
                                                                .quantidade
                                                                .toString()
                                                                .padLeft(
                                                                    2, "0"),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Muli')),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(36),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.black,
                                                              offset:
                                                                  Offset(0, 0),
                                                              blurRadius: 2.0,
                                                              spreadRadius: 1.6,
                                                            ), //BoxShadow
                                                          ],
                                                          color:
                                                              Colors.grey[400]),
                                                      child: Center(
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                _SalgadoList[
                                                                        index]
                                                                    .quantidade++;
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance
              .collection(widget.loja.nomeBd)
              .doc(DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                  .format(_dateTime!)
                  .toString())
              .set({
            "lojaId": widget.loja.lojaId,
            "loja": widget.loja.nomeBd,
            "datedoc": DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                  .format(_dateTime!)
                  .toString(),
            "data": DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                  .format(_dateTime!)
                  .toString(),
            "enviado": false,
            "cachorro": _SalgadoList[0].quantidade,
            "misto": _SalgadoList[1].quantidade,
            "enroladinho": _SalgadoList[2].quantidade,
            "esfirra": _SalgadoList[3].quantidade,
            "empada": _SalgadoList[4].quantidade,
            "diplomata": _SalgadoList[5].quantidade,
            "mistaM": _SalgadoList[6].quantidade,
            "mista": _SalgadoList[7].quantidade,
            "camaraoM": _SalgadoList[8].quantidade,
            "camarao": _SalgadoList[9].quantidade,
            "americano": _SalgadoList[10].quantidade,
            "cachorroG": _SalgadoList[11].quantidade,
            "empadaCama": _SalgadoList[12].quantidade,
            "empadao": _SalgadoList[13].quantidade,
            "presqueij": _SalgadoList[14].quantidade,
            "enroladao": _SalgadoList[15].quantidade,
            "esfirraG": _SalgadoList[16].quantidade,
          });
          setState(() {
            _SalgadoList[0].quantidade = 0;
            _SalgadoList[1].quantidade = 0;
            _SalgadoList[2].quantidade = 0;
            _SalgadoList[3].quantidade = 0;
            _SalgadoList[4].quantidade = 0;
            _SalgadoList[5].quantidade = 0;
            _SalgadoList[6].quantidade = 0;
            _SalgadoList[7].quantidade = 0;
            _SalgadoList[8].quantidade = 0;
            _SalgadoList[9].quantidade = 0;
            _SalgadoList[10].quantidade = 0;
            _SalgadoList[11].quantidade = 0;
            _SalgadoList[12].quantidade = 0;
            _SalgadoList[13].quantidade = 0;
            _SalgadoList[14].quantidade = 0;
            _SalgadoList[15].quantidade = 0;
            _SalgadoList[16].quantidade = 0;
          });
          Navigator.pop(context);
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
