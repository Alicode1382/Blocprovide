import 'package:flutter/material.dart';

class Menuitem extends StatefulWidget {
  final title;
  final icon;
  final ontap;

  Menuitem({@required this.title, @required this.icon, @required this.ontap});

  @override
  _MenuitemState createState() => _MenuitemState();
}

class _MenuitemState extends State<Menuitem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListTile(
        onTap: widget.ontap,
        title: new Text(
          widget.title,
          style: new TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        trailing: new Icon(
          widget.icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
