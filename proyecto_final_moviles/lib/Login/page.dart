import 'package:flutter/material.dart';



class Pintar extends StatefulWidget {

  @override

  _PintarState createState() => _PintarState();

}



class _PintarState extends State<Pintar> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Ayuda'),

      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          Container(

            child: Text('Ayuda kenetttt!!!!!!!'),

          ),          

        ],

      ),

    );

  }
}