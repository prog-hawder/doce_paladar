import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ContagemCard(Function()? onTap, QueryDocumentSnapshot doc) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                if(doc["weekday"]== "Mon")
                Text("Segunda",style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),)
                else if (doc["weekday"]== "Tue")
                Text("Terça",style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),)
                        else if (doc["weekday"]==  "Wed")
                Text("Quarta",style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),)
                        else if (doc["weekday"]==  "Thurs")
                Text("Quinta",style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),)
                        else if (doc["weekday"]==  "Fri")
                Text("Sexta",style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),)
                        else if (doc["weekday"]==  "Sat")
                Text("Sabado",style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Muli'),),
              Text(doc["data"])
          ]
          ),
        ),
    ),
  );
}
