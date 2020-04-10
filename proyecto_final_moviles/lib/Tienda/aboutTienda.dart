import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';

class AboutStore extends StatefulWidget {
  Store tienda;
  AboutStore({@required this.tienda, key}) : super(key: key);

  @override
  _AboutStoreState createState() => _AboutStoreState();
}

class _AboutStoreState extends State<AboutStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us..."),
      ),
    );
  }
}