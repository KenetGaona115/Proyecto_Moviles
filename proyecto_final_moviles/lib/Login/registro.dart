import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool box = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Image.network(
                    "https://pngimage.net/wp-content/uploads/2018/06/uber-icon-png-1.png",
                    height: 100,
                    )
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "INGRESE LOS DATOS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
          // Entrada de nombre completo
          /*
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Nombre completo:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          */
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Escribe tu nombre'
                  ),
            ),
          ),

          //Entrada de user name
          /*
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Nombre de usuario:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          */
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Escribe tu nombre de usuario'
                  ),
            ),
          ),

          // entrada de email
          /*
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  "Email:",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          */
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'ingresa_tu_email@xpert.com'
              ),
            ),
          ),
          /*
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Numero de telefono",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          */
          SizedBox(
            height: 6.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'Escribe tu numero de telefono'
                  ),
            ),
          ),
          //Etrada de contraseña
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
                child: Text(
                  "Contraseña",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility_off),
                filled: false,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Ingresa tu contrsaseña',
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Checkbox(
                    value: box,
                    activeColor: Theme.of(context).buttonColor,
                    onChanged: (bool newValue) {
                      setState(() {
                        box = newValue;
                      });
                    }),
                Text(
                  'ACEPTO TERMINOS Y CONDICIONES DE USO',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  height: 40.0,
                  minWidth: 350.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                  ),
                  color: Colors.black,
                  child: Text(
                    "CREAR CUENTA",
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18,
                      fontFamily: "AkzidenzGrotesk",
                    ),
                  ),
                  onPressed: () {},
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
