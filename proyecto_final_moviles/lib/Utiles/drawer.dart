import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text("APPTIVAWEB"),
              accountEmail: Text("informes@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                fit: BoxFit.cover
              )
            ),
          ),
          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text("MENU 1", style: TextStyle(color: Colors.white),),
            ),
          ),
          new ListTile(
            title: Text("MENU 2"),
            onTap: (){},
          ),
          new ListTile(
            title: Text("MENU 3"),
          ),
          new ListTile(
            title: Text("MENU 4"),
          )

                 ],
      ) ,
    );
  }
}