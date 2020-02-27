import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _SearchAppBarState createState() => new _SearchAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = new Text("Busca un restaurante...");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return 
        new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Buscar...",
                      hintStyle: new TextStyle(color: Colors.white)),
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("Busca un restaurante...");
              }
            });
          },
        ),
      ]);
  }
}
