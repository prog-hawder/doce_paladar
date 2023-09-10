import 'package:flutter/material.dart';

class Assados extends StatelessWidget {
  const Assados({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/pedidosassados");
        },
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(1, 2), blurRadius: 5),
                  BoxShadow(
                    color: Colors.black,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("Pedidos Assados",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Muli')),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.whatshot,
                  color: Colors.orange[400],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Congelados extends StatelessWidget {
  const Congelados({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/pedidoslojas");
        },
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(1, 2), blurRadius: 5),
                  BoxShadow(
                    color: Colors.black,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("Pedidos Congelados",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Muli')),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.ac_unit,
                  color: Colors.blue[300],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

