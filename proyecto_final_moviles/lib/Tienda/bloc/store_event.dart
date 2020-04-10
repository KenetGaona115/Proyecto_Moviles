part of 'store_bloc.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();
}

class InitEventStore extends StoreEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
