import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Producto/pordDetail.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';

class ScrollProd extends StatefulWidget {
  final Producto prod;
  ScrollProd({Key key, this.prod}) : super(key: key);

  @override
  _ScrollProdState createState() => _ScrollProdState();
}

class _ScrollProdState extends State<ScrollProd> {
  Producto model;
  @override
  void initState() {
    model = widget.prod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=> ProductDetail(prod: widget.prod))
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
          ),
          color: CARD_COLOR,
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
                          image: new NetworkImage(_checkImage())),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(
                        "${model.precio}",
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
                            text: '${model.nombre.toUpperCase()}\n\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                            text: model.descripcion.length < 15?'${model.descripcion}':'${model.descripcion.substring(0,15)}..',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkImage() {
    if (model.imagen == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return model.imagen;
  }
}
