import 'package:proyecto_final_moviles/Producto/producto.dart';

class CartItem {
  List<Producto> prod = List();
  List<int> cantidad = List();
  CartItem({this.cantidad,this.prod});
  
  void set setDataProd(Producto x){
    this.prod.add(x);
  }

  void set setDataCant(int x){
    this.cantidad.add(x);
  }  
}