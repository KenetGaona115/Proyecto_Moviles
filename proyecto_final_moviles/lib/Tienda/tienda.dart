import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Models/scrollProd.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';

class ShowStore extends StatefulWidget {
  final Store tienda;
  ShowStore({Key key, @required this.tienda}) : super(key: key);

  @override
  _ShowStoreState createState() => _ShowStoreState();
}

class _ShowStoreState extends State<ShowStore> {
  
  final Firestore _firestore = Firestore.instance;
  List<Producto> _prodList;
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
            color: Colors.red,
              height: MediaQuery.of(context).size.height*.3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.tienda.logo,
              ),
            
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${widget.tienda.categoria}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                
                child: ListView(
                  scrollDirection:Axis.vertical,
                  children:_prodList.map((prod) => ScrollProd(
                    prod: prod,
                  )).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _checkImage() {
    if (widget.tienda.logo == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return widget.tienda.logo;
  }

  
  Future<bool> _loadListsProducts() async {
    try {
      var prod = await _firestore.collection("productos").getDocuments();
      _prodList = prod.documents
          .map((prod) => Producto(
              idStore: prod["idStore"],
              descripcion: prod["desc"],
              imagen: prod["imagen"],
              nombre: prod["nombre"],
              precio: prod["precio"]))
          .where((test)=> test.idStore == widget.tienda.id).toList();
      return true;
    } catch (e) {
      return false;
    }
}
}