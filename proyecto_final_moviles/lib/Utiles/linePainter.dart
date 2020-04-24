import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIniciio extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Path path = Path();
    Paint paint =  Paint();

  path =Path();
  path.lineTo(0, size.height*0.5);
  path.lineTo(size.width, size.height);
  path.close();
  paint.color = colorOne;
  canvas.drawPath(path, paint);
  
  //segundo color
  path =Path();
  path.lineTo(size.height*0.3,size.height*0.9);
  path.lineTo(size.width, size.height*0.01);
  path.close();
  paint.color = colorTwo;
  canvas.drawPath(path, paint);

  //Tercer color
  path =Path();
  path.lineTo(size.width, size.height);
  path.quadraticBezierTo(0, size.height, size.width*0.2, size.height);
  path.close();
  paint.color = colorThree;
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return oldDelegate != this;
  }
  
}

Color colorOne = Colors.black;
Color colorTwo = Colors.blueGrey;
Color colorThree = Color(0xff7b05bf);

final appTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
);