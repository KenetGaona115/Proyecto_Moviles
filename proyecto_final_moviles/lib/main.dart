import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/sscreen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SplashScreen(),
      ),
    );
  }
}

