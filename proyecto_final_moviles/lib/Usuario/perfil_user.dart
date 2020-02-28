import 'package:flutter/material.dart';

class PerfilUser extends StatefulWidget {
  PerfilUser({Key key}) : super(key: key);

  @override
  _PerfilUserState createState() => _PerfilUserState();
}

class _PerfilUserState extends State<PerfilUser> {
  String c = "";

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController _textController = TextEditingController();
          return AlertDialog(
            title: Text('Cambiar contraseña'),
            content: TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: "Contraseña nueva"),
              
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('Guardar'),
                onPressed: () {
                  c = _textController.text;
                  Navigator.of(context).pop();

                  // navegar2(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Información personal"),
      ),
      body: Container(
        //       width: 400,
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Row(
//                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Icon(
                          Icons.person,
                          size: 80,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text('Cambiar imagen de perfil'),
                        flex: 2,
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_forward_ios),
                        flex: 1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Nombre",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Manuel Sanchez",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Row(
//                    mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Número de telefono",
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Text('**0250'),
                            flex: 1,
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Row(
//                    mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Cambiar la contraseña",
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Text('****'),
                            flex: 1,
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                            //  tooltip: 'Increase volume by 10',
                              onPressed: () {
                                _displayDialog(context);
                              },
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Row(
//                    mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Correo electrónico",
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Text('@gmail.com'),
                            flex: 1,
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Row(
//                    mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Formas de pago",
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Text('VISA'),
                            flex: 1,
                          ),
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Row(
//                    mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Eliminar cuenta",
                              style: TextStyle(fontSize: 20),
                            ),
                            flex: 4,
                          ),
                          /*  Expanded(
                            child: Text('****'),
                            flex: 1,
                          ),*/
                          Expanded(
                            child: Icon(Icons.arrow_forward_ios),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}