import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';

class Carrito extends StatefulWidget {
  Carrito({Key key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int total = 0;
  @override
  void initState() {
    _getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return _getBody();
    } catch (e) {
      print(e);
      return _getErrorBody();
    }
  }

  _checkImage(Producto x) {
    if (x.imagen == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return x.imagen;
  }

  Widget _getBody() {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          SizedBox(width: 10,),
          Text(
            "TOTAL ",
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Icon(
            Icons.attach_money,
            size: 50,
          ),
          Text(
            "$total",
            style: TextStyle(
              fontSize: 50
            ),
          ),
          SizedBox(width: 15,),
          FlatButton(
            child: Text("Pagar"),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            color: Colors.lightBlue,
            onPressed: (){
              carritoListProd.removeRange(0, carritoListProd.length);
              carritoListCant.removeRange(0, carritoListCant.length);
              Navigator.pop(context);
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Carrito de compras"),
      ),
      body: ListView.builder(
        itemCount: carritoListProd.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black),
              ),
              color: Colors.lightBlueAccent,
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        height: 120.0,
                        margin: EdgeInsets.fromLTRB(5, 2, 0, 0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                              _checkImage(carritoListProd[index]),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.control_point_duplicate),
                          Text(
                            "${carritoListCant[index].toString()}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${carritoListProd[index].nombre.toUpperCase()}\n\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      setState(() {
                        _deleteItem(index);
                         _getTotal();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getErrorBody() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito vacio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("No hay productos!")],
      ),
    );
  }

  _deleteItem(int index) {
    carritoListCant.removeAt(index);
    carritoListProd.removeAt(index);
  }

  _getTotal() {
    total = 0;
    setState(() {
      for (var i = 0; i < carritoListProd.length; i++) {
        total += carritoListProd[i].precio * carritoListCant[i];
      }
    });
  }

   _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Compra realizada'));
    _scaffoldKey.currentState..showSnackBar(snackBar);
  }
}
