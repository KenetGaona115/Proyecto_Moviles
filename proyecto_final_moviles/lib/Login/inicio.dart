import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Login/login.dart';
import 'package:proyecto_final_moviles/Login/registro.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToLogin(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>Login())
    );
  }
  _navigateToRegistro(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>Registro())
    );
  }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 130),
                  child: Image.network(
                    "https://pngimage.net/wp-content/uploads/2018/06/uber-icon-png-1.png",
                    height: 250,
                    ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: MaterialButton(
              child: Text(
                "REGISTRATE",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              height: 40,
              minWidth: 350,
              color: Theme.of(context).buttonColor,
              onPressed: () {
                _navigateToRegistro();
              },
            ),
          ),
          MaterialButton(
            child: Text(
              "INGRESA",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            height: 40,
            minWidth: 350,
            color: Theme.of(context).buttonColor,
            onPressed: () {
              _navigateToLogin();
            },
          ),
        ],
      ),
    );
  }
}
