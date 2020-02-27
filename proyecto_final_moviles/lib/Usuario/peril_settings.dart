import 'package:flutter/material.dart';

class PerfilSettings extends StatefulWidget {
  PerfilSettings({Key key}) : super(key: key);

  @override
  _PerfilSettingsState createState() => _PerfilSettingsState();
}

class _PerfilSettingsState extends State<PerfilSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracion"),
      ),
      body: Column(
        children: <Widget>[
          Text("data")
        ],
      ),
    );
  }
}