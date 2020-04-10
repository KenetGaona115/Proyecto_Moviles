import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Models/scrollProd.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'dart:async';

class ShowStore extends StatefulWidget {
  final Store tienda;
  ShowStore({Key key, @required this.tienda}) : super(key: key);

  @override
  _ShowStoreState createState() => _ShowStoreState();
}

class _ShowStoreState extends State<ShowStore> {
  final Firestore _firestore = Firestore.instance;
  List<Producto> _prodList;
  List<Producto> get getProdList => _prodList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.tienda.nombre}"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 1,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(_checkImage()),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "${widget.tienda.categoria}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                              iconSize: MediaQuery.of(context).size.height*.05,
                              icon: Icon(Icons.info),
                              onPressed: () {
                                //Navigator para informacion del negocio
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(child: _widgetProd())
            ],
          ),
        ],
      ),
    );
  }

//Revisamos si el link de la imagen funciona
  _checkImage() {
    if (widget.tienda.logo == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return widget.tienda.logo;
  }

//cargamos la lista de los productos
  Future<bool> _loadListsProducts() async {
    try {
      var prod = await _firestore.collection("productos").getDocuments();
      _prodList = prod.documents
          .map((prod) => Producto(
              idStore: prod["idStore"],
              descripcion: prod["descripcion"],
              imagen: prod["imagen"],
              nombre: prod["nombre"],
              precio: prod["precio"]))
          .toList();

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

//Regresamos el Widget correspondiente
  Widget _widgetProd() {
    try {
      return ListView(
        scrollDirection: Axis.vertical,
        children: _prodList
            .map((producto) => ScrollProd(
                  prod: producto,
                ))
            .toList(),
      );
    } catch (e) {
      print(e);
      return Container(
        child: Text("Contenido no disponible"),
      );
    }
  }
}
