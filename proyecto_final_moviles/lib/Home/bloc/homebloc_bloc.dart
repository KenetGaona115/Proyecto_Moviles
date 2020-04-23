import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:proyecto_final_moviles/Models/categoria.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  final Firestore _firestore = Firestore.instance;
  List<Store> _storeList;
  List<Store> _storeListFilter;
  List<Categoria> _categoryList;

  List<Store> get getStoreList => _storeList;
  List<Store> get getStoreListFilter => _storeListFilter;
  List<Categoria> get getCategoryList => _categoryList;

  @override
  HomeblocState get initialState => HomeblocInitial();

  @override
  Stream<HomeblocState> mapEventToState(
    HomeblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is InitEvent) {
      if (await _loadLists()) {
        yield InitialLoad(_categoryList, _storeList);
      } else
        yield InitialLoadError("no hay datos cargados");
    }
  }

  //metodo para cargar las listas de los elementos necesarios para el inicio <<Catgorias, Stores>>
  Future<bool> _loadLists() async {
    try {
      var stores = await _firestore.collection("stores").getDocuments();
      _storeList = stores.documents
          .map((stores) => Store(
              categoria: stores["categoria"],
              nombre: stores["nombre"],
              logo: stores["imagen"],
              liked: stores["liked"],
              cat_number: stores["categoryID"],
              isSelected: stores["isSelected"],
              id: stores["IDstore"],
              horario: List.from(stores["horario"]),
              cal: stores["cal"].toDouble(), 
              tel: stores["tel"]
              ),
          )
          .toList();

      var category = await _firestore.collection("categoria").getDocuments();
      _categoryList = category.documents
          .map(
            (category) => Categoria(
              categoria: category["descripcion"],
              id: category["id"],
              image: category["imagen"],
            ),
          )
          .toList();

      return true;
    } catch (e) {
      return false;
    }
  }
}
