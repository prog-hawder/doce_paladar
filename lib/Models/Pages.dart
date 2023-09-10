
import 'package:doce_paladar/Models/Pages/PedidosLojas/PedidosLojas.dart';
import 'package:flutter/cupertino.dart';

class Pages {
  final int PageId;

  final String PageName;
  final String PageRoute;

  Pages({
    required this.PageRoute,
    required this.PageId,
    required this.PageName,
  });
  static List<Pages> PageList = [
    Pages(
      PageId: 0,
      PageName: "Pedidos Congelados",
      PageRoute: '/pedidoslojas',
    ),
    Pages(
      PageId:1,
      PageName: "Pedidos Assados",
      PageRoute: '/pedidosassados',
    ),
    Pages(
      PageId:0,
      PageName: "Contagem",
      PageRoute: '/contagem',
    ),
     Pages(
      PageId:2,
      PageName: "Estoque",
      PageRoute: '/estoque',
    ),
    Pages(
      PageId:3,
      PageName: "Configurações",
      PageRoute: '/config',
    )
  ];
}
