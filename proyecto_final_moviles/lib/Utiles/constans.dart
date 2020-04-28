import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Carrito/itemCarrito.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Utiles/search.dart';
import 'package:proyecto_final_moviles/Utiles/search.dart';

const Color Back_Color = Colors.white;

var divProd =  Divider(
          thickness: 5,
          color: Colors.blueGrey,
          indent: 10,
          endIndent: 10,
        );

CartItem _carrList  = new CartItem();
List<Producto> carritoListProd = new List<Producto>();
List<int> carritoListCant = new List<int>();

