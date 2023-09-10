class Salgados {
  final int Id;
  final String salgadoName;
  var quantidade;
  final String salgadoImg;
  final String salgadoPct;
  final String salgadodoc;
  Salgados({
    required this.Id,
    required this.salgadoName,
    required this.salgadoImg,
    required this.salgadoPct,
    required this.quantidade,
    required this.salgadodoc,
  });
  static List<Salgados> SalgadosList = [
    Salgados(
        Id: 0,
        salgadoName: "Bolinha de Queijo",
        salgadoImg:
            "assets/image/bolinhaqueijo.jpg",
        salgadoPct: "50 und",
        salgadodoc: "bolinhaq",
        quantidade: 0,),
    Salgados(
      quantidade: 0,
        Id: 1,
        salgadoName: "Coxinha",
        salgadoImg:
            "assets/image/coxinha.jpg",
        salgadoPct: "50 und",
        salgadodoc: "coxinha"),
    Salgados(
      quantidade: 0,
        Id: 2,
        salgadoName: "Coxinha C/ Cat",
        salgadoImg:
            "assets/image/coxinhacat.jpg",
        salgadoPct: "50 und",
        salgadodoc: "coxinhacat"),
    Salgados(
      quantidade: 0,
        Id: 3,
        salgadoName: "Coxinha C/ Cheddar",
        salgadoImg:
            "assets/image/coxinha-chedar.jpg",
        salgadoPct: "50 und",
        salgadodoc: "coxinhacheddar"),
    Salgados(
      quantidade: 0,
        Id: 4,
        salgadoName: "Coxona",
        salgadoImg:
            "assets/image/coxona.jpg",
        salgadoPct: "10 und",
        salgadodoc: "coxona"),
    Salgados(
      quantidade: 0,
        Id: 5,
        salgadoName: "Empada de Frango",
        salgadoImg:
            "assets/image/empadafrango.jpg",
        salgadoPct: "25 und",
        salgadodoc: "empadafrango"),
    Salgados(
      quantidade: 0,
        Id: 6,
        salgadoName: "Empada de Palmito",
        salgadoImg:
            "assets/image/empadapalmito.jpg",
        salgadoPct: "25 und",
        salgadodoc: "empadapalmito"),
    Salgados(
      quantidade: 0,
        Id: 7,
        salgadoName: "Empadão Goiano",
        salgadoImg:
            "assets/image/empadao.jpg",
        salgadoPct: "1 und",
        salgadodoc: "empadao"),
    Salgados(
      quantidade: 0,
        Id: 8,
        salgadoName: "Empanado de Salsicha",
        salgadoImg:
            "assets/image/empanado.jpg",
        salgadoPct: "50 und",
        salgadodoc: "empanado"),
    Salgados(
      quantidade: 0,
        Id: 9,
        salgadoName: "Esfirra Folheada Carne",
        salgadoImg:
            "assets/image/folheadacarne.jpg",
        salgadoPct: "25 und",
        salgadodoc: "abertacarne"),
    Salgados(
      quantidade: 0,
        Id: 10,
        salgadoName: "Esfirra Folheada Frango",
        salgadoImg:
            "assets/image/abertafrango.jpg",
        salgadoPct: "25 und",
        salgadodoc: "abertafrango"),
    Salgados(
      quantidade: 0,
        Id: 11,
        salgadoName: "Kibe",
        salgadoImg:
            "assets/image/kibe.jpg",
        salgadoPct: "50 und",
        salgadodoc: "kibe"),
    Salgados(
      quantidade: 0,
        Id: 12,
        salgadoName: "Kibe C/ Catupiry",
        salgadoImg:
            "assets/image/kibecat.jpg",
        salgadoPct: "50 und",
        salgadodoc: "kibecat"),
    Salgados(
      quantidade: 0,
        Id: 13,
        salgadoName: "Pastel Assado Carne",
        salgadoImg:
            "assets/image/assadocarne.jpg",
        salgadoPct: "25 und",
        salgadodoc: "assdcarne"),
    Salgados(
      quantidade: 0,
        Id: 14,
        salgadoName: "Pastel Assado Frango",
        salgadoImg: "assets/image/assadofrango.jpg",
        salgadoPct: "25 und",
        salgadodoc: "assdfrango"),
    Salgados(
      quantidade: 0,
        Id: 15,
        salgadoName: "Pastel Frito Carne",
        salgadoImg:
            "assets/image/fritocarne.png",
        salgadoPct: "25 und",
        salgadodoc: "fritocarne"),
    Salgados(
      quantidade: 0,
        Id: 16,
        salgadoName: "Pastel Frito Queijo",
        salgadoImg:
            "assets/image/fritoqueijo.jpg",
        salgadoPct: "25 und",
        salgadodoc: "fritoqueijo"),
    Salgados(
      quantidade: 0,
        Id: 17,
        salgadoName: "Risole",
        salgadoImg:
            "assets/image/risole.jpg",
        salgadoPct: "50 und",
        salgadodoc: "risole"),
  ];
}

class SalgadosMini {
  final int Id;
  final String salgadoName;
  int quantidade;
  final String salgadoImg;
  final String salgadoPct;
  final String salgadodoc;
  SalgadosMini({
    required this.quantidade,
    required this.salgadodoc,
    required this.Id,
    required this.salgadoName,
    required this.salgadoImg,
    required this.salgadoPct,
  });
  static List<SalgadosMini> SalgadosMiniList = [
    SalgadosMini(
        Id: 0,
        salgadoName: "Mini Coxinha",
        salgadoImg:
            "assets/image/minicoxinha.jpg",
        salgadoPct: "1 frd com 8 pct",
        salgadodoc: "mcoxinha",
        quantidade: 0,),
    SalgadosMini(
        Id: 1,
        salgadoName: "Mini Risole",
        salgadoImg:
        "assets/image/minirisole.jpg",
       salgadoPct: "1 frd com 8 pct",
        salgadodoc: "mrisole",
        quantidade: 0,),
    SalgadosMini(
        Id: 2,
        salgadoName: "Mini Kibe",
        salgadoImg:
            "assets/image/minikibe.jpg",
        salgadoPct: "1 frd com 8 pct",
        salgadodoc: "mkibe",
        quantidade: 0,),
    SalgadosMini(
        Id: 3,
        salgadoName: "Mini Bolinha Cheddar",
        salgadoImg:
            "assets/image/minicheddar.jpg",
        salgadoPct: "1 frd com 8 pct",
        salgadodoc: "mcheddar",
        quantidade: 0,),
    SalgadosMini(
        Id: 4,
        salgadoName: "Mini Bolinha Queijo",
        salgadoImg:
            "assets/image/miniqueijo.jpg",
        salgadoPct: "1 frd com 8 pct",
        salgadodoc: "mqueijo",
        quantidade: 0,),
    SalgadosMini(
        Id: 5,
        salgadoName: "Mini Bolinha Presunto",
        salgadoImg:
            "assets/image/minipresunto.jpg",
        salgadoPct: "1 frd com 8 pct",
        salgadodoc: "mpresunto",
        quantidade: 0,),
    SalgadosMini(
        Id: 6,
        salgadoName: "Mini Churros",
        salgadoImg:
            "assets/image/minichurros.jpg",
        salgadoPct: "1 pct com 50 und",
        salgadodoc: "churros",
        quantidade: 0,),
    SalgadosMini(
        Id: 7,
        salgadoName: "Batata Palito",
        salgadoImg:
            "assets/image/batata.jpg",
        salgadoPct: "1 pct",
        salgadodoc: "batata",
        quantidade: 0,),
    SalgadosMini(
        Id: 8,
        salgadoName: "Batata Canoa e Frango",
        salgadoImg:
            "assets/image/refeicao.jpg",
        salgadoPct: "1 pct de cada",
        salgadodoc: "frango",
        quantidade: 0,)
  ];
}

class Salgadoassado {
  final int Id;
  final String salgadoName;
  final String salgadodoc;
  final String salgadoImg;
  var quantidade;
  Salgadoassado({
    required this.quantidade,
    required this.Id,
    required this.salgadoName,
    required this.salgadoImg,
    required this.salgadodoc
  });
  static List<Salgadoassado> SalgadoList = [
    Salgadoassado(
      Id: 0,
      salgadoName: "Cachorro Quente",
      salgadoImg:
          "assets/image/cachorro.jpg",
      salgadodoc: 'cachorro',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 1,
      salgadoName: "Mini Misto",
      salgadoImg:
          "assets/image/misto.jpg",
      salgadodoc: 'misto',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 2,
      salgadoName: "Enroladinho de Queijo",
      salgadoImg:
          "assets/image/enroladinho.jpg",
      salgadodoc: 'enroladinho',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 3,
      salgadoName: "Esfirra Fechada",
      salgadoImg:
          "assets/image/esfirra.png",
      salgadodoc: 'esfirra',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 4,
      salgadoName: "Empada de Frango",
      salgadoImg:
          "assets/image/empadafrango.jpg",
      salgadodoc: 'empada',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 5,
      salgadoName: "Diplomata",
      salgadoImg:
          "assets/image/diplomata.jpg",
      salgadodoc: 'diplomata',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 6,
      salgadoName: "Torta Mista 'M'",
      salgadoImg:
          "assets/image/mista.jpg",
      salgadodoc: 'mistaM',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 7,
      salgadoName: "Torta Mista Ind",
      salgadoImg:
          "assets/image/mista.jpg",
     salgadodoc: 'mista',
     quantidade: 0,
    ),
    Salgadoassado(
      Id: 8,
      salgadoName: "Torta de Camarão 'M'",
      salgadoImg:
          "assets/image/camaraoind.jpg",
      salgadodoc: 'camaraoM',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 9,
      salgadoName: "Torta de Camarão Ind",
      salgadoImg:
          "assets/image/camaraoind.jpg",
      salgadodoc: 'camarao',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 10,
      salgadoName: "Americano De Frango",
      salgadoImg: "assets/image/americano.png",
      salgadodoc: 'americano',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 11,
      salgadoName: "Cachorro quente 'G'",
      salgadoImg:
          "assets/image/cachorrog.jpg",
      salgadodoc: 'cachorroG',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 12,
      salgadoName: "Empada de Camarão 'G'",
      salgadoImg:
          "assets/image/empadacamarao.jpg",
      salgadodoc: 'empadaCama',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 13,
      salgadoName: "Empadão Goiano",
      salgadoImg:
          "assets/image/empadao.jpg",
      salgadodoc: 'empadao',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 14,
      salgadoName: "Enroladão P/Q",
      salgadoImg:
          "assets/image/enroladaopq.jpg",
      salgadodoc: 'presqueij',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 15,
      salgadoName: "Enroladão Queijo",
      salgadoImg:
          "assets/image/enroladao.png",
      salgadodoc: 'enroladao',
      quantidade: 0,
    ),
    Salgadoassado(
      Id: 16,
      salgadoName: "Esfirra Fechada 'G'",
      salgadoImg:
          "assets/image/esfirrag.jpg",
      salgadodoc: 'esfirraG',
      quantidade: 0,
    ),
  ];
}