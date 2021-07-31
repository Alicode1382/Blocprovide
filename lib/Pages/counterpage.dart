import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/bloc/counter_bloc.dart';
import 'package:theme/bloc/theme_bloc.dart';

class Counerpage extends StatelessWidget {
  const Counerpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Counterbloc, int>(
        builder: (context, state) {
          return Center(
            child: new Text("counter you : ${state}",
                style:
                    new TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          );
        },
      ),
      floatingActionButton: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.bloc<Counterbloc>().add(Counterevent.incerement);
            },
            child: new Icon(Icons.add),
          ),
          SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            onPressed: () {
              context.bloc<Counterbloc>().add(Counterevent.decrement);
              context.bloc<Theme_bloc>().add(Theme_event.toggle);
            },
            child: new Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
