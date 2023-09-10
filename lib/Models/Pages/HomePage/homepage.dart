

import 'package:doce_paladar/Models/Pages.dart';
import 'package:doce_paladar/Models/Pages/LoginPage/LoginScreen.dart';
import 'package:doce_paladar/Models/Services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Acess/Acesse.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    List<Pages> _PagesList = Pages.PageList;
    return Scaffold(
      drawer:
       Drawer(
        backgroundColor: Colors.white,
        child: DrawerItens(_PagesList),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Doce Paladar'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
            ),
            if(auth.usuario?.email== 'prog.hawder@gmail.com')
            Column(
              children: [
                identif("Hawder V. da Veiga", "Development"),
                SizedBox(height: 40,),
              Congelados(),
              Assados()
              ],
            )
            else if(auth.usuario?.email=='loja1@docepaladar.com')
            Column(
              children:[
              identif("Loja1", "Atendimento"),
              SizedBox(height: 40,),
              Congelados(),
              Assados()])
             else if(auth.usuario?.email=='loja2@docepaladar.com')
            Column(
              children:[
              identif("Loja2", "Atendimento"),
              SizedBox(height: 40,),
              Congelados(),
              Assados()])
              else if(auth.usuario?.email=='lojabps@docepaladar.com')
            Column(
              children:[
              identif("Loja Bps", "Atendimento"),
              SizedBox(height: 40,),
              Congelados(),
              Assados()])
            else if(auth.usuario?.email=='lojahavan@docepaladar.com')
            Column(
              children:[
              identif("Havan", "Atendimento"),
              SizedBox(height: 40,),
              Congelados(),
              Assados()])
          ],
        ),
      ),
    );
  }

  ListView DrawerItens(List<Pages> _PagesList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _PagesList.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, _PagesList[index].PageRoute);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(offset: Offset(1, 2), blurRadius: 5),
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_PagesList[index].PageName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Muli'
                          )),
                        SizedBox(width: 5,),
                        if(_PagesList[index].PageId == 0)
                        Icon(Icons.ac_unit,color: Colors.blue[300],)  
                        else if(_PagesList[index].PageId == 1)
                        Icon(Icons.whatshot,color: Colors.orange[400],)
                        else if(_PagesList[index].PageId==2)
                        Icon(Icons.shopping_cart_outlined, color: Colors.greenAccent)
                        else if(_PagesList[index].PageId==3)
                        Icon(Icons.settings, color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}


class identif extends StatelessWidget {
  final String name;
  final String classic;

 identif(@required this.name, @required this.classic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Muli'
            )),
    SizedBox(
      height: 10,
    ),
    Text("Development",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'Muli'
        )),]);
  }
}
