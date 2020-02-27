import 'package:flutter/material.dart';

class PayMethos extends StatefulWidget {
  PayMethos({Key key}) : super(key: key);

  @override
  _PayMethosState createState() => _PayMethosState();
}

class _PayMethosState extends State<PayMethos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metodos de pago"),
      ),
      body: Column(
        children: <Widget>[
          Text("data")
        ],
      ),
    );
  }
}