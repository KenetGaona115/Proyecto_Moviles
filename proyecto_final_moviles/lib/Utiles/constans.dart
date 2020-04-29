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

const Color PRIMARY_COLOR = Color(0xff731A5C2);
const Color SECOND_COLOR = Color(0xff39C3E6);
const Color CARD_COLOR = Color(0xffE6DFDF);
const Color BUTTON_ACEPT_COLOR = Color(0xff5420EB);
const Color BUTTON_CANCEL_COLOR = Color(0xffFF303B);
const Color APPBAR_COLOR = Color(0xff731A5C2);
const Color BACKGROUND_COLOR = Color(0xffEBE8FF);

const TEXT_TITLE_STYLE = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold
);

const TEXT_SUBTITLE_STYLE = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold
);

const TEXT_ALERT_STYLE = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Color(0xff3D3D40)
);