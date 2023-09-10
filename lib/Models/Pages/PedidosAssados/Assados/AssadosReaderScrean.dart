import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Listas/Listas.dart';

class AssadosReaderScrean extends StatefulWidget {
  AssadosReaderScrean(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<AssadosReaderScrean> createState() => _AssadosReaderScreanState();
}

class _AssadosReaderScreanState extends State<AssadosReaderScrean> {
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
                  Text(widget.doc["data"],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Muli')),
                  IconButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection(widget.doc["loja"])
                            .doc(widget.doc["datedoc"])
                            .delete();
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.black,
                      )
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
                                                height: 35,
                                                width: 105,
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
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(8, 0, 8, 0),
                                                      child: Center(
                                                        child: Text(
                                                            widget.doc[_SalgadoList[index]
                                                                .salgadodoc]
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
            if(widget.doc["enviado"] == false)
            await FirebaseFirestore.instance
                .collection(widget.doc["loja"])
                .doc(widget.doc["datedoc"])
                .update({"enviado": true});
            else
            Navigator.pop(context);

            Navigator.pop(context);
          },
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue),
      );
  }
}
