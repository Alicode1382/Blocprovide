import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Counterevent { incerement, decrement }

class Counterbloc extends Bloc<Counterevent, int> {
  Counterbloc() : super(0);

  @override
  Stream<int> mapEventToState(Counterevent event) async* {
    if (event == Counterevent.incerement) {
      yield state + 1;
    } else {
      yield state - 1;
    }
  }
}
