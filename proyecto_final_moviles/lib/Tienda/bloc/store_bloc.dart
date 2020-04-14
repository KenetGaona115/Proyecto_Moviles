import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:proyecto_final_moviles/Models/scrollCategory.dart';
import 'package:proyecto_final_moviles/Producto/producto.dart';
import 'package:proyecto_final_moviles/Tienda/itemTienda.dart';
import 'package:proyecto_final_moviles/Tienda/tienda.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  Store tienda = ReturnStore.t;
  final Firestore _firestore = Firestore.instance;
  List<Producto> _prodList;
  List<Producto> get getListProd =>_prodList;

  @override
  StoreState get initialState => StoreInitial();

  @override
  Stream<StoreState> mapEventToState(
    StoreEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is InitEventStore) {
      if (await _loadListsProducts()) {
        yield InitialLoadStore(_prodList);
      }else
      yield InitialLoadStoreError("no se pudieron obtener los datos");
    }
  }

  Future<bool> _loadListsProducts() async {
    try {
      var prod = await _firestore.collection("productos").getDocuments();
      _prodList = prod.documents
          .map((prod) => Producto(
              idStore: prod["idStore"],
              descripcion: prod["descripcion"],
              imagen: prod["imagen"],
              nombre: prod["nombre"],
              precio: prod["precio"]))
          .toList();
      return true;
    } catch (e) {
      return false;
    }
  }
}
