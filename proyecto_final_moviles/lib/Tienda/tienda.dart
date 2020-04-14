import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_moviles/Models/scrollProd.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Tienda/bloc/store_bloc.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'dart:async';

import 'aboutTienda.dart';

class ShowStore extends StatefulWidget {
  final Store tienda;
  ShowStore({Key key, @required this.tienda}) : super(key: key);

  @override
  _ShowStoreState createState() => _ShowStoreState();
}

class _ShowStoreState extends State<ShowStore> {
  StoreBloc _bloc;
  List<Producto> _listProd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.tienda.nombre}"),
        ),
        body: BlocProvider(
          create: (context) {
            _bloc = StoreBloc()..add(InitEventStore());
            return _bloc;
          },
          child: BlocBuilder<StoreBloc, StoreState>(builder: (context, state) {
            return _bodyWidget();
          }),
        ));
  }

//Revisamos si el link de la imagen funciona
  _checkImage() {
    if (widget.tienda.logo == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return widget.tienda.logo;
  }

//Regresamos el Widget correspondiente
  Widget _widgetProd() {
    ReturnStore._retStore(widget.tienda);
    _returnListProd();
    try {
      if (_listProd.length > 0) {
        return Container(
        height: MediaQuery.of(context).size.height * 0.51,
        child: ListView.builder(
          itemCount:_listProd.length,
          itemBuilder: (BuildContext context, int index) {
            return ScrollProd(
              prod: _listProd[index]);
          },
        ),
      );
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Contenido no diponible",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Image.network(
              "https://cdn0.iconfinder.com/data/icons/file-24/64/file-10-512.png",
              height: 150,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      );
    }
  }

//Cuerpo de la pagina
  Widget _bodyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 1,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width,
          child: Image.network(_checkImage()),
        ),
        Divider(
          thickness: 5,
          color: Colors.blueGrey,
          indent: 10,
          endIndent: 10,
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
                            iconSize: MediaQuery.of(context).size.height * .05,
                            icon: Icon(Icons.info),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => AboutStore(
                                        tienda: widget.tienda,
                                      )));
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.blueGrey,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
        Material(
          child: Container(
            child: SingleChildScrollView(
              child: _widgetProd(),
            ),
          ),
        )
      ],
    );
  }

//Hacemos el filtrado de la lista de los productos
  _returnListProd(){
    _listProd = (
      _bloc.getListProd.where(
        (test)=> test.idStore == widget.tienda.id
      ).length > 0? _bloc.getListProd.where((test)=> test.idStore == widget.tienda.id).toList():null);
  }
}

class ReturnStore {
  static Store t;
  static _retStore(Store x) {
    ReturnStore.t = x;
  }
}
