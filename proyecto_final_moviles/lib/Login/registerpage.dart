import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Registro';

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passswordController = TextEditingController();

  bool _success;

  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.blueGrey,
          child: Stack(
            children: <Widget>[
              Container(),
              Container(
                child: new Card(
                  color: Colors.grey[100],
                  margin: new EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 250.0, bottom: 80.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 8.0,
                  child: new Padding(
                    padding: new EdgeInsets.all(25.0),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Correo',
                                hintText: 'manuel.vmagmail.com',
                                icon: Icon(Icons.email)),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Porfavor agrega un texto';
                              }
                            },
                          ),
                        ),
                        new Container(
                          child: new TextFormField(
                            controller: _passswordController,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              icon: Icon(
                                Icons.vpn_key,
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Porfavor ingresa la contrasña';
                              }
                            },
                          ),
                        ),
                        Divider(),
                        FlatButton(
                            child: Text('Registrar'),
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                            onPressed: () {
                              _register();
                            }),
                        Container(
                          alignment: Alignment.center,
                          child: Text(_success == null
                              ? ''
                              : (_success
                                  ? 'Registro correcto' + _userEmail
                                  : 'Registro invalido')),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validar() {
    _emailController.dispose();

    _passswordController.dispose();

    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passswordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;

        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
}
