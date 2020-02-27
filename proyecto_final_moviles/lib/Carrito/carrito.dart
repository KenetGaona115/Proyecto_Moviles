import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  Carrito({Key key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito de compras"),
      ),
      body: Column(
        children: <Widget>[
          Text("data")
        ],
      ),
    );
  }
}