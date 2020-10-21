import 'package:flutter/material.dart';
import 'package:poutube/CustomSearchDelegate.dart';
import 'package:poutube/telas/Biblioteca.dart';
import 'package:poutube/telas/EmAlta.dart';
import 'package:poutube/telas/Incricoes.dart';
import 'package:poutube/telas/Inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado ="";

  @override
  Widget build(BuildContext context) {



    List<Widget> telas=[
      Inicio(_resultado),
      EmAlta(),
      Incricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity:1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset("./lib/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
           String res= await  showSearch(context: context, delegate: CustomSearchDelegate());
           setState(() {
             _resultado=res;
           });
            },
          ),
          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
            },
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
            },
          ),

          */

        ],


      ),



      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual= indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),

          BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),

          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
