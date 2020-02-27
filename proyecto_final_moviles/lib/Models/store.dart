import 'package:flutter/foundation.dart';

enum StoreCategory { Hamburguesas, Tacos, Sushi, Helados }

class Store {
  final String storeName; // nombre de la tienda
  final String storeDescription; // descripcion de la tienda
  final String storeImage; // url de imagen del logo de la tienda
  bool liked;

  Store({
    @required this.storeName,
    @required this.storeDescription,
    @required this.storeImage,
    this.liked = false,
  }); 
}
