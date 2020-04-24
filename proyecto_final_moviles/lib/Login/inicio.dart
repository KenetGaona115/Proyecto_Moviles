import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Login/login.dart';
import 'package:proyecto_final_moviles/Login/registro.dart';
import 'package:proyecto_final_moviles/Utiles/linePainter.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToLogin() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    }

    _navigateToRegistro() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Registro()));
    }

    return Scaffold(
      body: CustomPaint(
        painter: CustomIniciio(),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 80, 0, 130),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 110.0,
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundImage:AssetImage("assets/logoApp.jpeg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  child: Text(
                    "INGRESA",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  height: 40,
                  minWidth: 350,
                  color: Colors.black,
                  onPressed: () {
                    _navigateToLogin();
                  },
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                child: Text(
                  "REGISTRA",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                height: 40,
                minWidth: 350,
                color: Colors.black,
                onPressed: () {
                  _navigateToRegistro();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
