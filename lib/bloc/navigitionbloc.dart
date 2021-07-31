import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/Pages/Myorderpage.dart';
import 'package:theme/Pages/counterpage.dart';
import 'package:theme/Pages/homepage.dart';
import 'package:theme/Pages/themepage.dart';

enum Navigationevent {
  HomePageclickevent,
  MyOrderPageclickevent,
  Counterpage,
  theme
}

class Navigationbloc extends Bloc<Navigationevent, Widget> {
  Navigationbloc() : super(Homepage());

  @override
  Stream<Widget> mapEventToState(Navigationevent event) async* {
    if (event == Navigationevent.HomePageclickevent) {
      yield Homepage();
    } else if (event == Navigationevent.MyOrderPageclickevent) {
      yield Myorderpage();
    } else if (event == Navigationevent.Counterpage) {
      yield Counerpage();
    }
  }
}
