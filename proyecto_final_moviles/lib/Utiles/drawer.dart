import 'package:flutter/material.dart';

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
                    image: NetworkImage(
                        "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                    fit: BoxFit.cover)),
            currentAccountPicture:
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage("https://ca-times.brightspotcdn.com/dims4/default/50efff7/2147483647/strip/true/crop/3000x4540+0+0/resize/840x1271!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F83%2Fa3%2F851ffd104bd0986ed347756dfac9%2Fd63f471a8356ccda64ee91a57761765ec662853f.jpg"),
                
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
            onTap: () {},
          ),
          new ListTile(
            title: Text("Favoitos"),
          ),
          new ListTile(
            title: Text("Pedidos"),
          )
        ],
      ),
    );
  }
}
