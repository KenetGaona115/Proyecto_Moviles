import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  @override
  StoreState get initialState => StoreInitial();

  @override
  Stream<StoreState> mapEventToState(
    StoreEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
