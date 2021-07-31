import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/bloc/navigitionbloc.dart';
import 'package:theme/slidebar.dart';

import 'Pages/homepage.dart';

class Sliderbarlayout extends StatefulWidget {
  const Sliderbarlayout({Key key}) : super(key: key);

  @override
  _SliderbarlayoutState createState() => _SliderbarlayoutState();
}

class _SliderbarlayoutState extends State<Sliderbarlayout> {
  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: BlocProvider<Navigationbloc>(
          create: (context) => Navigationbloc(),
          child: Stack(
            children: [
              BlocBuilder<Navigationbloc, Widget>(
                builder: (context, state) {
                  return state;
                },
              ),
              Slidebar(),
            ],
          ),
        )));
  }
}
