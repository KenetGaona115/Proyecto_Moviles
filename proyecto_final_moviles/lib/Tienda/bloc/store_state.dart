part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();
}

class StoreInitial extends StoreState {
  @override
  List<Object> get props => [];
}

class InitialLoadStore extends StoreState {
  
  final List<dynamic> listProd;

  InitialLoadStore(this.listProd);

  @override
  List<Object> get props => [listProd];
}

class InitialLoadStoreError extends StoreState {
  final String err;

  InitialLoadStoreError(this.err);
  @override
  List<Object> get props => [err];
}