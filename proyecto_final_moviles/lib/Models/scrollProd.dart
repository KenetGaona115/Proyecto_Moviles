import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';

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
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
        child: GestureDetector(
          onTap: () {
            //funcion para navegar a detalle
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(_checkImage()),
                          radius: 70,
                        )
                      ],
                    ),
                    // SizedBox(height: 5),
                    Text(
                      "${model.nombre}",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ],
            ),
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
