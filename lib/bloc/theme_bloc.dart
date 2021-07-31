import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Theme_event { toggle }

class Theme_bloc extends Bloc<Theme_event, ThemeData> {
  Theme_bloc() : super(ThemeData.light());

  @override
  Stream<ThemeData> mapEventToState(Theme_event event) async* {
    if (state == Theme_event.toggle) {
      yield ThemeData.light();
    } else {
      yield ThemeData.dark();
    }
  }
}
