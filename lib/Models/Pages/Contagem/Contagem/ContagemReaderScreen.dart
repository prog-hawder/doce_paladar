import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doce_paladar/Models/Pages/Contagem/ContagemPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContagemReaderScreen extends StatefulWidget {
  ContagemReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<ContagemReaderScreen> createState() => _ContagemReaderScreenState();
}

class _ContagemReaderScreenState extends State<ContagemReaderScreen> {
  List<Salgados> _SalgadosList = Salgados.SalgadosList;
  String day = DateFormat.d().format(DateTime.now()).toString();
  String daySem = DateFormat.E().format(DateTime.now()).toString();
  String date = DateFormat.Md().format(DateTime.now()).toString();
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
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _SalgadosList.length,
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
                        Expanded(
                            flex: 6,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(17.0),
                                    topRight: Radius.circular(17.0)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        _SalgadosList[index].salgadoImg),
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
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(_SalgadosList[index].salgadoName,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  fontFamily: 'Muli')),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 5, 12, 5),
                                            child: Container(
                                              height: 36,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  color: Colors.white),
                                              child: Center(
                                                child: divisao(index),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 5, 12, 5),
                                            child: Container(
                                              height: 36,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  color: Colors.white),
                                              child: Center(
                                                child: restodiv(index),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(_SalgadosList[index].salgadoPct,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
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
              },
            ))
          ],
        ),
      ),
    );
  }

  Text restodiv(int index) {
    return Text(
                                                  widget.doc[
                                                          _SalgadosList[index]
                                                              .salgadodocp]
                                                      .toString()
                                                      .padLeft(2, "0")
                                                      .padRight(3, " pcts"),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily: 'Muli'));
  }

  Text divisao(int index) {
    return Text(
                                                  widget.doc[
                                                          _SalgadosList[index]
                                                              .salgadodoc]
                                                      .toString()
                                                      .padLeft(2, "0")
                                                      .padRight(3, " cx"),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily: 'Muli'));
  }
}

class Salgados {
  final int Id;
  final String salgadoName;
  final String salgadodoc;
  final String salgadoImg;
  final String salgadoPct;
  final String salgadodocp;
  Salgados({
    required this.Id,
    required this.salgadodoc,
    required this.salgadoName,
    required this.salgadoImg,
    required this.salgadoPct,
    required this.salgadodocp
  });
  static List<Salgados> SalgadosList = [
    Salgados(
        Id: 0,
        salgadoName: "Bolinha de Queijo",
        salgadoImg:
            "https://produtospredileto.ind.br/temp/bolinhas-81-1920x1080m1.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "bolinhaq", salgadodocp: "bolinhaqp"),
    Salgados(
        Id: 1,
        salgadoName: "Coxinha",
        salgadoImg:
            "https://docepaladar.com.br/wp-content/uploads/2021/07/salgado-1-scaled.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "coxinha",
        salgadodocp: "coxinhap"),
    Salgados(
        Id: 2,
        salgadoName: "Coxinha C/ Cat",
        salgadoImg:
            "https://i.pinimg.com/736x/22/32/27/22322767b846cbe47fc134526e488fc5.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "coxinhacat",
        salgadodocp: "coxinhacatp"),
    Salgados(
        Id: 3,
        salgadoName: "Coxinha C/ Cheddar",
        salgadoImg:
            "https://docepaladar.com.br/wp-content/uploads/2022/02/coxinha-chedar.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "coxinhacheddar",
        salgadodocp: "coxinhacheddarp"),
    Salgados(
        Id: 4,
        salgadoName: "Coxona",
        salgadoImg:
            "https://grupodocedoce.com.br/storage/produtos/101/panutti-coxinha-de-frango-com-requeijao-1582552656.JPG",
        salgadoPct: "10 pcts por cx",
        salgadodoc: "coxona",
        salgadodocp: "coxonap",
        ),
    Salgados(
        Id: 5,
        salgadoName: "Empada de Frango",
        salgadoImg:
            "https://static.itdg.com.br/images/1200-675/4b5235592ca4303a2cafa984d1813fa9/127094-original.jpg",
        salgadoPct: "25 pcts por cx",
        salgadodoc: "empadafrango",
        salgadodocp: "empadafrangop"),
    Salgados(
        Id: 6,
        salgadoName: "Empada de Palmito",
        salgadoImg:
            "https://static1.minhavida.com.br/recipes/16/8a/4b/df/empadinha-de-palmito-orig-1.jpg",
        salgadoPct: "25 pcts por cx",
        salgadodoc: "empadapalmito",
        salgadodocp: "empadapalmitop"),
    Salgados(
        Id: 7,
        salgadoName: "Empadão Goiano",
        salgadoImg:
            "https://cdn0.tudoreceitas.com/pt/posts/1/1/9/empadao_goiano_2911_600.jpg",
        salgadoPct: "27 und por cx",
        salgadodoc: "empadao",
        salgadodocp: "empadaop"),
    Salgados(
        Id: 8,
        salgadoName: "Empanado de Salsicha",
        salgadoImg:
            "https://thumb-cdn.soluall.net/prod/shp_products/sp1280fw/a8c0002a-636e-4eae-915c-9b3766296fb2/c7b7e6d9-995e-4198-9239-2d02e8bbaeaa.png",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "empanado",
        salgadodocp: "empanadop"),
    Salgados(
        Id: 9,
        salgadoName: "Esfirra Folheada Carne",
        salgadoImg:
            "https://ederepente50.files.wordpress.com/2016/11/esfira.jpg",
        salgadoPct: "25 pcts por cx",
        salgadodoc: "abertacarne",
        salgadodocp: "abertacarnep"),
    Salgados(
        Id: 10,
        salgadoName: "Esfirra Folheada Frango",
        salgadoImg:
            "https://dw0jruhdg6fis.cloudfront.net/producao/25032465/G/20200612_175213.jpg",
        salgadoPct: "25 pcts por cx",
        salgadodoc: "abertafrango",
        salgadodocp: "abertafrangop",
        ),
    Salgados(
        Id: 11,
        salgadoName: "Kibe",
        salgadoImg:
            "https://www.saborbrasil.it/wp-content/uploads/2021/06/quibe-frito1.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "kibe",
        salgadodocp: "kibep"),
    Salgados(
      salgadodocp: "kibecatp",
        Id: 12,
        salgadoName: "Kibe C/ Catupiry",
        salgadoImg:
            "https://octoshop.sfo2.digitaloceanspaces.com/lojas/gymchef/uploads_produto/48427946-1960569577361488-3887331524734877696-n-61f468fb9f478.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "kibecat"),
    Salgados(
      salgadodocp: "assdcarnep",
        Id: 13,
        salgadoName: "Pastel Assado Carne",
        salgadoImg:
            "https://img.cybercook.com.br/imagens/receitas/312/pasteis-assados-de-carne.jpg",
        salgadoPct: "25 pcts por cx",
        salgadodoc: "assdcarne"),
    Salgados(
      salgadodocp: "assdfrangop",
        Id: 14,
        salgadoName: "Pastel Assado Frango",
        salgadoImg: "https://i.ytimg.com/vi/-sE3wq24iGc/maxresdefault.jpg",
        salgadoPct: "25 pcts por cx",
        salgadodoc: "assdfrango"),
    Salgados(
      salgadodocp: "fritocarnep",
        Id: 15,
        salgadoName: "Pastel Frito Carne",
        salgadoImg:
            "https://video-caloria.s3.amazonaws.com/alimento/pastel-frito-carne.png",
        salgadoPct: "25 bdjs por cx",
        salgadodoc: "fritocarne"),
    Salgados(
      salgadodocp: "fritoqueijop",
        Id: 16,
        salgadoName: "Pastel Frito Queijo",
        salgadoImg:
            "https://www.saboresajinomoto.com.br/uploads/images/recipes/pastel-de-queijo.jpg",
        salgadoPct: "25 bdjs por cx",
        salgadodoc: "fritoqueijo"),
    Salgados(
      salgadodocp: "risolep",
        Id: 17,
        salgadoName: "Risole",
        salgadoImg:
            "https://docepaladar.com.br/wp-content/uploads/2022/02/risole-de-milho.jpg",
        salgadoPct: "15 pcts por cx",
        salgadodoc: "risole"),
    Salgados(
      salgadodocp: "mcoxinhap",
      Id: 18,
      salgadoName: "Mini Coxinha",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94316066_1435404039994670_558149296675880960_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=9267fe&_nc_ohc=SAcR9D9rWK4AX_37tJx&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfDiQywnk151OZC98OYn-u1yxi2BWfAFAYVBxN8-QNytzA&oe=64A70FBD",
      salgadoPct: "4 frd por cx",
      salgadodoc: 'mcoxinha',
    ),
    Salgados(
      salgadodocp: "mrisolep",
      Id: 19,
      salgadoName: "Mini Risole",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94148897_1435403529994721_2052463767228252160_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=9267fe&_nc_ohc=OGtD43ezSF0AX9SD_cZ&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfAVZvycvp9ZCQhOdkSwyRSDJpDDPp66N4IT6R4hJ44JhQ&oe=64A70E58",
      salgadoPct: "4 frd por cx",
      salgadodoc: 'mrisole',
    ),
    Salgados(
      salgadodocp: "mkibep",
      Id: 20,
      salgadoName: "Mini Kibe",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/93409549_1435403936661347_8525512307353059328_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=9267fe&_nc_ohc=A5bRo9HHqq8AX9PpGG3&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfB0rj0Fr3P2ufoDn9TN3f3Olg-QQqoiSA2uDP91KiWINA&oe=64A72E8B",
      salgadoPct: "4 frd por cx",
      salgadodoc: 'mkibe',
    ),
    Salgados(
      salgadodocp: "mcheddarp",
      Id: 21,
      salgadoName: "Mini Bolinha Cheddar",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/93367177_1435403369994737_5797643655560822784_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=9267fe&_nc_ohc=_6SRttNq3kEAX_BrAFa&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfBLB-423EkN3uOzgYLHhI-Eu_tjRJ8MwGERNmrzbOwc_g&oe=64A71801",
      salgadoPct: "4 frd por cx",
      salgadodoc: 'mcheddar',
    ),
    Salgados(
      salgadodocp: "mqueijop",
      Id: 22,
      salgadoName: "Mini Bolinha Queijo",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94312931_1435403833328024_3262200928882655232_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=9267fe&_nc_ohc=ahWf07tenzMAX-5WUOX&_nc_oc=AQmuycwQSO1RnPmGfn_rz7qvsQL4uyzaHQCrTizeHG8ShLELJsSccklrj2Xwwtv3vCtxI-0WDxE0RobQwMkwfCXv&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfA5V5b4AGSUS4zuovkvila4WvJon1a4hdxulZcDWa-HfA&oe=64A70F47",
      salgadoPct: "4 frd por cx",
      salgadodoc: 'mqueijo',
    ),
    Salgados(
      salgadodocp: "mpresuntop",
      Id: 23,
      salgadoName: "Mini Bolinha Presunto",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94238543_1435403249994749_8252927410433949696_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9267fe&_nc_ohc=5JS0Tv__s4kAX8rEEpx&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfBlexBQ3UJ3c7N2vnhPdny3773tnAtHJzQKCMA_4Ya1NQ&oe=64A72CF9",
      salgadoPct: "4 frd por cx",
      salgadodoc: 'mpresunto',
    ),
    Salgados(
      salgadodocp: "churrosp",
      Id: 24,
      salgadoName: "Mini Churros",
      salgadoImg:
          "https://scontent.fgyn10-1.fna.fbcdn.net/v/t1.6435-9/94078409_1435403733328034_5360204792696143872_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=9267fe&_nc_ohc=IiAFATctGzwAX_9ZGXv&_nc_ht=scontent.fgyn10-1.fna&oh=00_AfDDqmnaOmdhH92nM5k9hRDGhQtFlPBOuQDxM4FnznkxRQ&oe=64A6FCDD",
      salgadoPct: "25 pct por cx",
      salgadodoc: 'churros',
    ),
  ];
}
