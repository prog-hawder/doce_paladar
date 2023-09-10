import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../Listas/Listas.dart';
import '../PedidosLojas.dart';

class CreatePedido extends StatefulWidget {
  PedidosLoja loja;
  CreatePedido({super.key, required this.loja});
  @override
  State<CreatePedido> createState() => _CreatePedidoState();
}

class _CreatePedidoState extends State<CreatePedido> {
  DateTime? _dateTime = null;
  List<Salgados> _SalgadosList = Salgados.SalgadosList;
  List<SalgadosMini> _SalgadosMiniList = SalgadosMini.SalgadosMiniList;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
            if (widget.loja.lojaId < 4)
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _SalgadosList.length,
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
                                    flex: 9,
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17.0),
                                            topRight: Radius.circular(17.0)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                _SalgadosList[index]
                                                    .salgadoImg),
                                            fit: BoxFit.cover),
                                      ),
                                      child: null,
                                    )),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  _SalgadosList[index]
                                                      .salgadoName,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily: 'Muli')),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 37,
                                                  width: 108,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              36),
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      color: Colors.white),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                offset: Offset(
                                                                    0, 0),
                                                                blurRadius: 2.0,
                                                                spreadRadius:
                                                                    1.6,
                                                              ), //BoxShadow
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        36),
                                                            color: Colors
                                                                .grey[400]),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    if (_SalgadosList[index]
                                                                            .quantidade >
                                                                        0) {
                                                                      setState(
                                                                          () {
                                                                        _SalgadosList[index]
                                                                            .quantidade--;
                                                                      });
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .black,
                                                                  )),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                8, 0, 8, 0),
                                                        child: Center(
                                                          child: Text(
                                                              _SalgadosList[
                                                                      index]
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
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            36),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            0),
                                                                    blurRadius:
                                                                        2.0,
                                                                    spreadRadius:
                                                                        1.6,
                                                                  ), //BoxShadow
                                                                ],
                                                                color: Colors
                                                                    .grey[400]),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _SalgadosList[
                                                                              index]
                                                                          .quantidade++;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .black,
                                                                  )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                  _SalgadosList[index]
                                                      .salgadoPct,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14,
                                                      fontFamily: 'Muli'))
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
            else if (widget.loja.lojaId > 4)
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _SalgadosMiniList.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 261,
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
                                    flex: 6,
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(17.0),
                                            topRight: Radius.circular(17.0)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                _SalgadosMiniList[index]
                                                    .salgadoImg),
                                            fit: BoxFit.cover),
                                      ),
                                      child: null,
                                    )),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  _SalgadosMiniList[index]
                                                      .salgadoName,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily: 'Muli')),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 37,
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
                                                              if (_SalgadosMiniList[
                                                                          index]
                                                                      .quantidade >
                                                                  0) {
                                                                setState(() {
                                                                  _SalgadosMiniList[
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
                                                            _SalgadosMiniList[
                                                                    index]
                                                                .quantidade
                                                                .toString()
                                                                .padLeft(2,
                                                                    "0"),
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
                                                                _SalgadosMiniList[
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
                                              Text(
                                                  _SalgadosMiniList[index]
                                                      .salgadoPct,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14,
                                                      fontFamily: 'Muli'))
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
            "data": DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br')
                .format(_dateTime!)
                .toString(),
            "enviado": false,
            "bolinhaq": _SalgadosList[0].quantidade,
            "coxinha": _SalgadosList[1].quantidade,
            "coxinhacat": _SalgadosList[2].quantidade,
            "coxinhacheddar": _SalgadosList[3].quantidade,
            "coxona": _SalgadosList[4].quantidade,
            "empadafrango": _SalgadosList[5].quantidade,
            "empadapalmito": _SalgadosList[6].quantidade,
            "empadao": _SalgadosList[7].quantidade,
            "empanado": _SalgadosList[8].quantidade,
            "abertacarne": _SalgadosList[9].quantidade,
            "abertafrango": _SalgadosList[10].quantidade,
            "kibe": _SalgadosList[11].quantidade,
            "kibecat": _SalgadosList[12].quantidade,
            "assdcarne": _SalgadosList[13].quantidade,
            "assdfrango": _SalgadosList[14].quantidade,
            "fritocarne": _SalgadosList[15].quantidade,
            "fritoqueijo": _SalgadosList[16].quantidade,
            "risole": _SalgadosList[17].quantidade,
            "mcoxinha": _SalgadosMiniList[0].quantidade,
            "mrisole": _SalgadosMiniList[1].quantidade,
            "mkibe": _SalgadosMiniList[2].quantidade,
            "mcheddar": _SalgadosMiniList[3].quantidade,
            "mqueijo": _SalgadosMiniList[4].quantidade,
            "mpresunto": _SalgadosMiniList[5].quantidade,
            "churros": _SalgadosMiniList[6].quantidade,
            "batata": _SalgadosMiniList[7].quantidade,
            "frango": _SalgadosMiniList[8].quantidade,
          });
          setState(() {
            _SalgadosList[0].quantidade = 0;
            _SalgadosList[1].quantidade = 0;
            _SalgadosList[2].quantidade = 0;
            _SalgadosList[3].quantidade = 0;
            _SalgadosList[4].quantidade = 0;
            _SalgadosList[5].quantidade = 0;
            _SalgadosList[6].quantidade = 0;
            _SalgadosList[7].quantidade = 0;
            _SalgadosList[8].quantidade = 0;
            _SalgadosList[9].quantidade = 0;
            _SalgadosList[10].quantidade = 0;
            _SalgadosList[11].quantidade = 0;
            _SalgadosList[12].quantidade = 0;
            _SalgadosList[13].quantidade = 0;
            _SalgadosList[14].quantidade = 0;
            _SalgadosList[15].quantidade = 0;
            _SalgadosList[16].quantidade = 0;
            _SalgadosList[17].quantidade = 0;
            _SalgadosMiniList[0].quantidade = 0;
            _SalgadosMiniList[1].quantidade = 0;
            _SalgadosMiniList[2].quantidade = 0;
            _SalgadosMiniList[3].quantidade = 0;
            _SalgadosMiniList[4].quantidade = 0;
            _SalgadosMiniList[5].quantidade = 0;
            _SalgadosMiniList[6].quantidade = 0;
            _SalgadosMiniList[7].quantidade = 0;
            _SalgadosMiniList[8].quantidade = 0;
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
