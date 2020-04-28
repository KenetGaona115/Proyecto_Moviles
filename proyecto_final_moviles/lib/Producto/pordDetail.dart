import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Carrito/itemCarrito.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';
//import 'package:photo_view/photo_view.dart';

class ProductDetail extends StatefulWidget {
  final Producto prod;
  ProductDetail({Key key, @required this.prod}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Producto prod;
  int total = 0;
  int i = 1;
  @override
  void initState() {
    prod = widget.prod;
    total = prod.precio;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
           /*   PhotoView(
 imageProvider: imageProvider,
 minScale: PhotoViewComputedScale.contained * 0.8,
 maxScale: PhotoViewComputedScale.covered * 1.8,
 initialScale: PhotoViewComputedScale.contained * 1.1,
);*/
              Image.network(_checkImage()),
              Positioned(
                  child: Icon(
                Icons.access_time,
                size: 40,
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${prod.nombre.toUpperCase()}",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          divProd, //llamamos al divider
          Flexible(
            child: Text(
              "${prod.descripcion}",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SUMAMOS
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      total += prod.precio;
                      i++;
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    size: 50,
                  ),
                  label: Text("")),
              Text(
                i.toString(),
                style: TextStyle(fontSize: 30),
              ),
              //RESTAMOS
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (i > 1) {
                        total -= prod.precio;
                        i--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 50,
                  ),
                  label: Text(""))
            ],
          ),
          Text("TOTAL: $total", style: TextStyle(fontSize: 40)),
          FlatButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)),
            color: Colors.lightBlue,
            icon: Icon(
              Icons.add_shopping_cart,
              size: 40,
            ),
            onPressed: () {
              _sendOrder(i, prod);
              Navigator.pop(context);
            },
            label: Text(
              "Añadir a carrito",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  _checkImage() {
    if (prod.imagen == null) {
      return "https://cdn1.iconfinder.com/data/icons/the-basics/100/link-broken-chain-512.png";
    } else
      return prod.imagen;
  }
  _sendOrder(int x, Producto y) {
    if(carritoListProd.contains(y)){
      int index = carritoListProd.indexOf(y);
        carritoListCant[index] = (x + carritoListCant[index]);
    }
    else{
      carritoListProd.add(y);
      carritoListCant.add(x); 
    }
    print("se pidio: $x ${prod.nombre}");
  }
}
