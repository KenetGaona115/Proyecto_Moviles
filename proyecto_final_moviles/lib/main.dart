import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Home/home.dart';
import 'package:proyecto_final_moviles/Pago/met_pagos.dart';
import 'package:proyecto_final_moviles/Pago/pago.dart';
import 'package:proyecto_final_moviles/sscreen.dart';

import 'Login/login.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

