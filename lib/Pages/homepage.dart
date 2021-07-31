import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Text(
        "Homepage",
        style: new TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
      ),
    );
  }
}
