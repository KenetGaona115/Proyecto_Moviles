import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';

class ShowStore extends StatefulWidget {
  Store tienda;
  ShowStore({Key key, @required this.tienda}) : super(key: key);

  @override
  _ShowStoreState createState() => _ShowStoreState();
}

class _ShowStoreState extends State<ShowStore> {
  var x = "Tienda x";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.tienda.nombre}"),
      ),
      body: Column(
        children: <Widget>[ 
          Text("data")
        ],
      ),
    );
  }
}