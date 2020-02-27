import 'package:flutter/material.dart';

class PerfilUser extends StatefulWidget {
  PerfilUser({Key key}) : super(key: key);

  @override
  _PerfilUserState createState() => _PerfilUserState();
}

class _PerfilUserState extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Column(
        children: <Widget>[
          Text("data")
        ],
      ),
    );
  }
}