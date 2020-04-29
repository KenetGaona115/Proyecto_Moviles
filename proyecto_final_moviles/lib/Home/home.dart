import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_moviles/Carrito/carrito.dart';
import 'package:proyecto_final_moviles/Home/bloc/homebloc_bloc.dart';
import 'package:proyecto_final_moviles/Models/scrollCategory.dart';
import 'package:proyecto_final_moviles/Models/scrollTiendas.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:proyecto_final_moviles/Tienda/tienda.dart';
import 'package:proyecto_final_moviles/Utiles/constans.dart';
import 'package:proyecto_final_moviles/Utiles/drawer.dart';
import 'package:proyecto_final_moviles/Utiles/search.dart';
import 'package:proyecto_final_moviles/sscreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Store> _textFilter = List();
  List<Store> _lsitStores = List();
  bool isSearching = false;
  HomeblocBloc _bloc;
  int cat_number = Returned.x;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        drawer: MenuLateral(),
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
                  child: BlocProvider(
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
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        child: _search(),
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Error de carga"),
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Home())
                                );
                              },
                              child: Text("recargar"))
                        ],
                      )
                    ],
                  ),
                );
              }
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
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

//filtro de categoria, regresa la lista de stores por categoria que se selecciono
  Widget _productWidget(context) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .7,
      child: RefreshIndicator(
        onRefresh: ()async{
          //regresar
          _bloc.add(InitEvent());
        },
              child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 3,
            ),
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.vertical,
            children: (isSearching?_textFilter:_lsitStores)
                .map((product) => ScrollTienda(
                      tienda: product,
                    ))
                .toList()),
      ),
    );
  }

  Widget _search() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CARD_COLOR,
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
                     _textFilter.clear();
                     
                    setState(() {
                      if (name != "") {
                     
                        isSearching = true;
                        print(name);
                        _textFilter = _lsitStores
                            .where((x) => x.nombre
                                .toUpperCase()
                                .contains(name.toUpperCase()))
                            .toList();
                        
                    } else
                      isSearching = false;
                    });
                  },
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: MediaQuery.of(context).size.height * .05,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Carrito()));
                })
          ],
        ),
      ),
    );
  }

  _getListSotres() async{
    _lsitStores =  _bloc.getStoreList;
  }
}
