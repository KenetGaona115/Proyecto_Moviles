import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';
import 'package:proyecto_final_moviles/Utiles/drawer.dart';
import 'package:proyecto_final_moviles/Utiles/search.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var menu = new SearchAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Back_Color, 
      appBar: menu,
      drawer:MenuLateral(),
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
