import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Carrito/carrito.dart';
import 'package:proyecto_final_moviles/Usuario/perfil_user.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("USERNAME"),
            accountEmail: Text("user_mail@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(//imagen de fondo para el user
                        "https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/2019-06/que-hacer-guadalajara-poco-presupuesto.jpg"),
                    fit: BoxFit.cover)),
            currentAccountPicture: CircleAvatar(
              radius: 110,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/736x/e8/23/f9/e823f9ae8d85e1e0b65d463c0d8e7dc5.jpg"),
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text(
                "MENU DE OPCIONES",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          new ListTile(
            title: Text("Perfil"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => PerfilUser()));
            },
          ),
          new ListTile(
            title: Text("Carrito"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Carrito()));
            },
          ),
          new ListTile(
            title: Text("Pedidos"),
          )
        ],
      ),
    );
  }
}
