import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_moviles/Home/bloc/homebloc_bloc.dart';
import 'package:proyecto_final_moviles/Models/categoria.dart';
import 'package:proyecto_final_moviles/Models/home_list.dart';
import 'package:proyecto_final_moviles/Models/scrollCategory.dart';
import 'package:proyecto_final_moviles/Models/scrollTiendas.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:proyecto_final_moviles/Tienda/tienda.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';
import 'package:proyecto_final_moviles/Utiles/drawer.dart';
import 'package:proyecto_final_moviles/Utiles/search.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Store> _textFilter;
  List<Store> _lsitStores;
  bool isSearching = false;
  HomeblocBloc _bloc;
  int cat_number = Returned.x;

  var menu = new SearchAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Back_Color,
        drawer: MenuLateral(),
        resizeToAvoidBottomPadding: false,
        body: BlocProvider(
          create: (context) {
            _bloc = HomeblocBloc()..add(InitEvent());

            return _bloc;
          },
          child: BlocBuilder<HomeblocBloc, HomeblocState>(
              builder: (context, state) {
            if (state is InitialLoad) {
              _getListSotres();
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      child: _search(),
                    ),
                  ),
                  _categoryWidget(),
                  Container(
                    child: _productWidget(this.context),
                  )
                ],
              );
            } else if (state is InitialLoadError) {
              return Scaffold(
                body: Column(
                  children: <Widget>[Text("Error de carga")],
                ),
              );
            }
          }),
        ));
  }

  //Llamamos para mostrar las tiendas
  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: _bloc.getCategoryList
              .map((category) => ScrollCategorias(
                    model: category,
                  ))
              .toList()),
    );
  }

//widget para poder llamar a la barra de busueda
  List<Store> _filtroCategoria(int x) {
    List<Store> tempList = [];
    for (int i = 0; i < HomeList.restaurantList.length; i++) {
      if (x == HomeList.restaurantList[i].cat_number)
        tempList.add(HomeList.restaurantList[i]);
    }
    return tempList;
  }

//filtro de categoria, regresa la lista de stores por categoria que se selecciono
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
          children: (isSearching ? _textFilter : _lsitStores)
              .map((product) => ScrollTienda(
                    tienda: product,
                  ))
              .toList()),
    );
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
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Busca un restaurante...",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    )),
                //mientras haya texto en la barra de busqueda se efectuara el filtro
                onChanged: (name) {
                  setState(() {
                    if (name != "") {
                      print(name);
                      _textFilter = _lsitStores
                          .where((x) => x.nombre
                              .toUpperCase()
                              .contains(name.toUpperCase()))
                          .toList();
                      isSearching = true;
                    } else
                      isSearching = false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getListSotres() {
    _lsitStores = _bloc.getStoreList;
  }
}
