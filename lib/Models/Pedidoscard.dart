import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget PedidosCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 3.0,
                              spreadRadius: 1.4,
                            ), //BoxShadow
                          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(doc["enviado"] == true? Icons.check_circle: Icons.warning, color: Colors.amber[400],size: 40,),
              Center(
                child: Text(
                  doc["data"],
                  style:TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Muli'),
                  ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
