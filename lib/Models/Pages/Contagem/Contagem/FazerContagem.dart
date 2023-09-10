import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class FazerContagem extends StatefulWidget {
  const FazerContagem({super.key});

  @override
  State<FazerContagem> createState() => _FazerContagemState();
}

class _FazerContagemState extends State<FazerContagem> {
  String day = DateFormat.d().format(DateTime.now()).toString();
  String daySem = DateFormat.E().format(DateTime.now()).toString();
  String date = DateFormat.Md().format(DateTime.now()).toString();
  List<Salgados> _SalgadosList = Salgados.SalgadosList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
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
                    Text(date,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Muli')),
                    SizedBox(width: 30,)
                  ],
                ),
              ),
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
                                            image: NetworkImage(
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
                                          padding: const EdgeInsets.all(8.0),
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
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 133,
                                                    decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(36),
                                                            border: Border.all(
                                                                color:
                                                                    Colors.black),
                                                            color: Colors.white),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.all(1.0),
                                                          child: Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(36),
                                                                border: Border.all(
                                                                    color:
                                                                        Colors.black),
                                                                color: Colors.grey[400]),
                                                            child: Center(
                                                              child: GestureDetector(
                                                                  onTap: () {
                                                                    if (_SalgadosList[
                                                                                index]
                                                                            .quantidade >
                                                                        0) {
                                                                      setState(() {
                                                                        _SalgadosList[
                                                                                index]
                                                                            .quantidade--;
                                                                      });
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons.remove,
                                                                    color: Colors.black,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(8, 0, 8, 0),
                                                          child: Center(
                                                            child: Text(
                                                                _SalgadosList[index]
                                                                    .quantidade
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, "0").padRight(3, " cx"),
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
                                                        Padding(
                                                          padding: const EdgeInsets.all(1.0),
                                                          child: Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(36),
                                                                border: Border.all(
                                                                    color:
                                                                        Colors.black),
                                                                color: Colors.grey[400]),
                                                            child: Center(
                                                              child: GestureDetector(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      _SalgadosList[
                                                                              index]
                                                                          .quantidade++;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: Colors.black,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(36),
                                                            border: Border.all(
                                                                color:
                                                                    Colors.black),
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
                                                              border: Border.all(
                                                                  color:
                                                                      Colors.black),
                                                              color: Colors.grey[400]),
                                                          child: Center(
                                                            child: GestureDetector(
                                                                onTap: () {
                                                                  if (_SalgadosList[
                                                                              index]
                                                                          .pcts >
                                                                      0) {
                                                                    setState(() {
                                                                      _SalgadosList[
                                                                              index]
                                                                          .pcts--;
                                                                    });
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: Colors.black,
                                                                )),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(8, 0, 8, 0),
                                                          child: Center(
                                                            child: Text(
                                                                _SalgadosList[index]
                                                                    .pcts
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, "0").padRight(3, " pct"),
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
                                                              border: Border.all(
                                                                  color:
                                                                      Colors.black),
                                                              color: Colors.grey[400]),
                                                          child: Center(
                                                            child: GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    _SalgadosList[
                                                                            index]
                                                                        .pcts++;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: Colors.black,
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )],
                                              ),
                                              Text(
                                                  _SalgadosList[index]
                                                      .salgadoPct,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 17,
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
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance
              .collection("Contagem")
              .doc(daySem)
              .set({
            "day": day,
            "weekday":daySem,
            "data": date,
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
            "mcoxinha":_SalgadosList[18].quantidade,
            "mrisole":_SalgadosList[19].quantidade,
            "mkibe":_SalgadosList[20].quantidade,
            "mcheddar":_SalgadosList[21].quantidade,
            "mqueijo":_SalgadosList[22].quantidade,
            "mpresunto":_SalgadosList[23].quantidade,
            "churros":_SalgadosList[24].quantidade,
            "bolinhaqp": _SalgadosList[0].pcts,
            "coxinhap": _SalgadosList[1].pcts,
            "coxinhacatp": _SalgadosList[2].pcts,
            "coxinhacheddarp": _SalgadosList[3].pcts,
            "coxonap": _SalgadosList[4].pcts,
            "empadafrangop": _SalgadosList[5].pcts,
            "empadapalmitop": _SalgadosList[6].pcts,
            "empadaop": _SalgadosList[7].pcts,
            "empanadop": _SalgadosList[8].pcts,
            "abertacarnep": _SalgadosList[9].pcts,
            "abertafrangop": _SalgadosList[10].pcts,
            "kibep": _SalgadosList[11].pcts,
            "kibecatp": _SalgadosList[12].pcts,
            "assdcarnep": _SalgadosList[13].pcts,
            "assdfrangop": _SalgadosList[14].pcts,
            "fritocarnep": _SalgadosList[15].pcts,
            "fritoqueijop": _SalgadosList[16].pcts,
            "risolep": _SalgadosList[17].pcts,
            "mcoxinhap":_SalgadosList[18].pcts,
            "mrisolep":_SalgadosList[19].pcts,
            "mkibep":_SalgadosList[20].pcts,
            "mcheddarp":_SalgadosList[21].pcts,
            "mqueijop":_SalgadosList[22].pcts,
            "mpresuntop":_SalgadosList[23].pcts,
            "churrosp":_SalgadosList[24].pcts,
          });
          Navigator.pop(context);},
          child:Icon(Icons.check,color: Colors.white,),
        backgroundColor:Colors.blue,)
    );
  }
}
class Salgados {
  final int Id;
  final String salgadoName;
  var quantidade;
  var pcts;
  final String salgadoImg;
  final String salgadoPct;
  Salgados({
    required this.Id,
    required this.salgadoName,
    required this.salgadoImg,
    required this.salgadoPct,
    required this.quantidade,
    required this.pcts
  });
  static List<Salgados> SalgadosList = [
    Salgados(
      Id: 0,
      salgadoName: "Bolinha de Queijo",
      salgadoImg:
          "https://produtospredileto.ind.br/temp/bolinhas-81-1920x1080m1.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 1,
      salgadoName: "Coxinha",
      salgadoImg:
          "https://docepaladar.com.br/wp-content/uploads/2021/07/salgado-1-scaled.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 2,
      salgadoName: "Coxinha C/ Cat",
      salgadoImg:
          "https://i.pinimg.com/736x/22/32/27/22322767b846cbe47fc134526e488fc5.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 3,
      salgadoName: "Coxinha C/ Cheddar",
      salgadoImg:
          "https://docepaladar.com.br/wp-content/uploads/2022/02/coxinha-chedar.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 4,
      salgadoName: "Coxona",
      salgadoImg:
          "https://grupodocedoce.com.br/storage/produtos/101/panutti-coxinha-de-frango-com-requeijao-1582552656.JPG",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 5,
      salgadoName: "Empada de Frango",
      salgadoImg:
          "https://static.itdg.com.br/images/1200-675/4b5235592ca4303a2cafa984d1813fa9/127094-original.jpg",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 6,
      salgadoName: "Empada de Palmito",
      salgadoImg:
          "https://static1.minhavida.com.br/recipes/16/8a/4b/df/empadinha-de-palmito-orig-1.jpg",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 7,
      salgadoName: "Empadão Goiano",
      salgadoImg:
          "https://cdn0.tudoreceitas.com/pt/posts/1/1/9/empadao_goiano_2911_600.jpg",
      salgadoPct: "27 und por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 8,
      salgadoName: "Empanado de Salsicha",
      salgadoImg:
          "https://thumb-cdn.soluall.net/prod/shp_products/sp1280fw/a8c0002a-636e-4eae-915c-9b3766296fb2/c7b7e6d9-995e-4198-9239-2d02e8bbaeaa.png",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 9,
      salgadoName: "Esfirra Folheada Carne",
      salgadoImg: "https://ederepente50.files.wordpress.com/2016/11/esfira.jpg",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 10,
      salgadoName: "Esfirra Folheada Frango",
      salgadoImg:
          "https://dw0jruhdg6fis.cloudfront.net/producao/25032465/G/20200612_175213.jpg",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 11,
      salgadoName: "Kibe",
      salgadoImg:
          "https://www.saborbrasil.it/wp-content/uploads/2021/06/quibe-frito1.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 12,
      salgadoName: "Kibe C/ Catupiry",
      salgadoImg:
          "https://octoshop.sfo2.digitaloceanspaces.com/lojas/gymchef/uploads_produto/48427946-1960569577361488-3887331524734877696-n-61f468fb9f478.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 13,
      salgadoName: "Pastel Assado Carne",
      salgadoImg:
          "https://img.cybercook.com.br/imagens/receitas/312/pasteis-assados-de-carne.jpg",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 14,
      salgadoName: "Pastel Assado Frango",
      salgadoImg: "https://i.ytimg.com/vi/-sE3wq24iGc/maxresdefault.jpg",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 15,
      salgadoName: "Pastel Frito Carne",
      salgadoImg:
          "https://video-caloria.s3.amazonaws.com/alimento/pastel-frito-carne.png",
      salgadoPct: "25 bdj por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 16,
      salgadoName: "Pastel Frito Queijo",
      salgadoImg:
          "https://www.saboresajinomoto.com.br/uploads/images/recipes/pastel-de-queijo.jpg",
      salgadoPct: "25 bdj por cx" ,
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 17,
      salgadoName: "Risole",
      salgadoImg:
          "https://docepaladar.com.br/wp-content/uploads/2022/02/risole-de-milho.jpg",
      salgadoPct: "15 pct por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 18,
      salgadoName: "Mini Coxinha",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94316066_1435404039994670_558149296675880960_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=9267fe&_nc_ohc=SAcR9D9rWK4AX_37tJx&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfDiQywnk151OZC98OYn-u1yxi2BWfAFAYVBxN8-QNytzA&oe=64A70FBD",
      salgadoPct: "4 frd por cx",
      quantidade: 0,
      pcts:0
    ),
    Salgados(
      Id: 19,
      salgadoName: "Mini Risole",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94148897_1435403529994721_2052463767228252160_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=9267fe&_nc_ohc=OGtD43ezSF0AX9SD_cZ&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfAVZvycvp9ZCQhOdkSwyRSDJpDDPp66N4IT6R4hJ44JhQ&oe=64A70E58",
      salgadoPct: "4 frd por cx",
      quantidade: 0,
      pcts:0
    ),
     Salgados(
      Id: 20,
      salgadoName: "Mini Kibe",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/93409549_1435403936661347_8525512307353059328_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=9267fe&_nc_ohc=A5bRo9HHqq8AX9PpGG3&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfB0rj0Fr3P2ufoDn9TN3f3Olg-QQqoiSA2uDP91KiWINA&oe=64A72E8B",
      salgadoPct: "4 frd por cx",
      quantidade: 0,
      pcts:0
    ),
     Salgados(
      Id: 21,
      salgadoName: "Mini Bolinha Cheddar",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/93367177_1435403369994737_5797643655560822784_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=9267fe&_nc_ohc=_6SRttNq3kEAX_BrAFa&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfBLB-423EkN3uOzgYLHhI-Eu_tjRJ8MwGERNmrzbOwc_g&oe=64A71801",
      salgadoPct: "4 frd por cx",
      quantidade: 0,
      pcts:0
    ),
     Salgados(
      Id: 22,
      salgadoName: "Mini Bolinha Queijo",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94312931_1435403833328024_3262200928882655232_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=9267fe&_nc_ohc=ahWf07tenzMAX-5WUOX&_nc_oc=AQmuycwQSO1RnPmGfn_rz7qvsQL4uyzaHQCrTizeHG8ShLELJsSccklrj2Xwwtv3vCtxI-0WDxE0RobQwMkwfCXv&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfA5V5b4AGSUS4zuovkvila4WvJon1a4hdxulZcDWa-HfA&oe=64A70F47",
      salgadoPct: "4 frd por cx",
      quantidade: 0,
      pcts:0
    ),
     Salgados(
      Id: 23,
      salgadoName: "Mini Bolinha Presunto",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94238543_1435403249994749_8252927410433949696_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9267fe&_nc_ohc=5JS0Tv__s4kAX8rEEpx&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfBlexBQ3UJ3c7N2vnhPdny3773tnAtHJzQKCMA_4Ya1NQ&oe=64A72CF9",
      salgadoPct: "4 frd por cx",
      quantidade: 0,
      pcts:0
    ),
     Salgados(
      Id: 24,
      salgadoName: "Mini Churros",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94078409_1435403733328034_5360204792696143872_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9267fe&_nc_ohc=IiAFATctGzwAX_9ZGXv&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfDDqmnaOmdhH92nM5k9hRDGhQtFlPBOuQDxM4FnznkxRQ&oe=64A6FCDD",
      salgadoPct: "25 pct por cx",
      quantidade: 0,
      pcts:0
    ),
  ];
}