import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';
import 'package:proyecto_final_moviles/Utiles/drawer.dart';
import 'package:proyecto_final_moviles/Utiles/search.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var menu = new SearchAppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Back_Color,
      appBar: menu,
      drawer: MenuLateral(),
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            color: Colors.red,
          ),
          Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage('https://image.winudf.com/v2/image/Y29tLm9uZXppbmUuY2FybHNqcl9pY29uXzE1MDM5NTk4ODlfMDc4/icon.png?w=170&fakeurl=1'),
                            ),
                            title: Text(
                              'Tortas Toño',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text(
                                'Descripcion'),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('VISITAR'),
                                onPressed: () {/* ... */},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
