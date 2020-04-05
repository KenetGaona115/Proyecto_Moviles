part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();
}

class StoreInitial extends StoreState {
  @override
  List<Object> get props => [];
}

class InitialLoad extends StoreState {
  
  final List<dynamic> listProd;

  InitialLoad(this.listProd);

  @override
  List<Object> get props => [listProd];
}

class InitialLoadError extends StoreState {
  final String err;

  InitialLoadError(this.err);
  @override
  List<Object> get props => [err];
}