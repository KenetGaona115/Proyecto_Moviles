part of 'homebloc_bloc.dart';

abstract class HomeblocState extends Equatable {
  const HomeblocState();
}

class HomeblocInitial extends HomeblocState {
  @override
  List<Object> get props => [];
}

//Estado inicial para Home, dondes se cargan la lista de las catgorias y de los restaurantes
class InitialLoad extends HomeblocState {
  
  final List<dynamic> listStores;
  final List<dynamic> listCatagories;

  InitialLoad(this.listStores, this.listCatagories);

  @override
  List<Object> get props => [listStores,listCatagories];
}

class InitialLoadError extends HomeblocState {
  final String err;

  InitialLoadError(this.err);
  @override
  List<Object> get props => [err];
}

//Estado cuando seleccionamos una categoria y hacemos un filtrado
class SelectCategory extends HomeblocState {
  final List<dynamic> listFilter;

  SelectCategory(this.listFilter);
  @override
  List<Object> get props => [listFilter];
}

class SelectCategoryError extends HomeblocState {
  final String err;

  SelectCategoryError(this.err);
  @override
  List<Object> get props => [err];
}

//Estado para cuando se selecciona una tienda, donde se cargara la misma donde se ha hecho el tap
class SelectStore extends HomeblocState {
  final Store _store;

  SelectStore(this._store);
  @override
  List<Object> get props => [_store];
}

class SelectStoreError extends HomeblocState {
  final String err;

  SelectStoreError(this.err);
  @override
  List<Object> get props => [err];
}

//Estado para pintar las busquedas por nombre del negocio
class TextSearchLoad extends HomeblocState {
  final List<Store> listStoreText;

  TextSearchLoad(this.listStoreText);
  @override
  List<Object> get props => [listStoreText];
}

class TextSearchLoadError extends HomeblocState {
  final String err;

  TextSearchLoadError(this.err);
  @override
  List<Object> get props => [err];
}