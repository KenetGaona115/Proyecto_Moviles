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
  TextEditingController _textFilter;
  HomeblocBloc _bloc;

  var menu = new SearchAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Back_Color,
        drawer: MenuLateral(),
        body: BlocProvider(
          create: (context) {
            _bloc = HomeblocBloc()..add(InitEvent());
            return _bloc;
          },
          child: BlocBuilder<HomeblocBloc, HomeblocState>(
              builder: (context, state) {
            if (state is InitialLoad) {
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
            }
          }),
        ));
  }

  //Llamamos para mostrar las tiendas
  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: GestureDetector(
        onTap: () {
          //Obtenemos el elemento seleccionado en la lista de categorias
          //HomeList.categoryList[HomeList.categoryList.indexWhere((categoria) => categoria.liked == true)].id;
        },
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: _bloc.getCategoryList
                .map((category) => ScrollCategorias(
                      model: category,
                    ))
                .toList()),
      ),
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

//Widget para llamar a la lista de categorias de productos
  List<Store>_filtroText(String x){
    if (x == null) {
      return _bloc.getStoreList;
    }else
     return _bloc.getStoreListFilter;
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
          children: _bloc.getStoreList
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
                controller: _textFilter,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Busca un restaurante...",
                    hintStyle: TextStyle(fontSize: 12),
                    prefixIcon: IconButton(
                      color: Colors.black54,
                      icon: Icon(Icons.search),
                      onPressed: (){
                        setState(() {
                          _filtroText(_textFilter.toString());
                        });
                      },
                      )
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          //_icon(Icons.filter_list, color: Colors.black54),
        ],
      ),
    );
  }


/*
//regresa la lista de los restaurantes favoritos
List<Store> _filtroFavoritos() {
  return HomeList.restaurantList.where((i) => i.liked).toList();
}
*/

/*
 _filtroCategoria(HomeList
                  .categoryList[HomeList.categoryList
                      .indexWhere((categoria) => categoria.liked == true)]
                  .id)
*/
}
