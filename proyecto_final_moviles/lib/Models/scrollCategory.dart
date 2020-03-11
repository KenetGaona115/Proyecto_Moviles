import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Models/categoria.dart';

class ScrollCategorias extends StatelessWidget {
  // final String imagePath;
  // final String text;
  // final bool isSelected;
  final  Categoria model;
  ScrollCategorias({Key key,this.model})
      : super(key: key);

  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 10,),
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: model.liked ? Colors.lightBlueAccent: Colors.white54,
        border: Border.all(
            color: model.liked ? Colors.orange : Colors.grey,
            width: model.liked ? 2 : 1),
      ),
      child: Row(
        children: <Widget>[
          model.image != null ? Image.network(model.image) : SizedBox(),
          model.categoria == null ? Container()
          : Container(
            child: Text(
              "${model.categoria}"
            ),
          )
        ],
      ),
    );
  }
}