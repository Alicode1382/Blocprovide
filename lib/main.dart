import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/bloc/counter_bloc.dart';
import 'package:theme/bloc/theme_bloc.dart';
import 'package:theme/sliderbarlayout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<Counterbloc>(
            create: (context) => Counterbloc(),
          ),
          BlocProvider<Theme_bloc>(
            create: (context) => Theme_bloc(),
          )
        ],
        child: BlocBuilder<Theme_bloc, ThemeData>(builder: (context, state) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Side bar",
            theme: state,
            home: Sliderbarlayout(),
          );
        }));
  }
}
