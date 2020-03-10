import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  Store({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  var x = "Tienda x";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda $x"),
      ),
      body: Column(
        children: <Widget>[ 
          Text("data")
        ],
      ),
    );
  }
}