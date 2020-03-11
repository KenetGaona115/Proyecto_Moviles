import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/Models/home_list.dart';
import 'package:proyecto_final_moviles/Models/scrollCategory.dart';
import 'package:proyecto_final_moviles/Models/scrollTiendas.dart';
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
      drawer: MenuLateral(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              child: _search(),
              color: Colors.red,
            ),
          ),
          _categoryWidget(),
          Container(
            child:  _productWidget(this.context),
          )
        ],
      ),
    );
  }
}

Widget _search() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
         //_icon(Icons.filter_list, color: Colors.black54),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_search()],
      );
  }
  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: HomeList.categoryList
              .map((category) => ScrollCategorias(
                    model: category,
                  ))
              .toList()),
    );
  }

  Widget _productWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .7,
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20),
          padding: EdgeInsets.only(left: 20),
          scrollDirection: Axis.vertical,
          children: HomeList.restaurantList
              .map((product) => ScrollTienda(
                    tienda: product,
                  ))
              .toList()),
    );
  }