import 'package:flutter/material.dart';
import 'package:theme/bloc/navigitionbloc.dart';
import 'package:theme/menuitem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Slidebar extends StatefulWidget {
  const Slidebar({Key key}) : super(key: key);

  @override
  _SlidebarState createState() => _SlidebarState();
}

class _SlidebarState extends State<Slidebar>
    with SingleTickerProviderStateMixin {
  bool IsSlidebarOpen = true;
  AnimationController _animationcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationcontroller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    var screensizewidth = MediaQuery.of(context).size.width;
    var screensizeheight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        left: IsSlidebarOpen ? 65 : screensizewidth - 35,
        child: Row(
          children: [
            Container(
                width: screensizewidth - 100,
                height: screensizeheight,
                color: Color(0xff262aaa),
                child: new Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      title: new Text(
                        "MyApp",
                        style: new TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 7),
                        child: Text(
                          "test",
                          style: new TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff1bb5fd)),
                        ),
                      ),
                      leading: new CircleAvatar(
                        child: new Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                      height: 65,
                      indent: 32,
                    ),
                    Menuitem(
                      title: "Home",
                      icon: Icons.home,
                      ontap: () {
                        print("heloo");
                        context
                            .bloc<Navigationbloc>()
                            .add(Navigationevent.HomePageclickevent);
                        setState(() {
                          IsSlidebarOpen = !IsSlidebarOpen;
                        });
                      },
                    ),
                    Menuitem(
                      title: "My Order",
                      icon: Icons.add_shopping_cart,
                      ontap: () {
                        context
                            .bloc<Navigationbloc>()
                            .add(Navigationevent.MyOrderPageclickevent);
                        setState(() {
                          IsSlidebarOpen = !IsSlidebarOpen;
                        });
                      },
                    ),
                    Menuitem(
                        title: "counterpage",
                        icon: Icons.plus_one,
                        ontap: () {
                          context
                              .bloc<Navigationbloc>()
                              .add(Navigationevent.Counterpage);
                          setState(() {
                            IsSlidebarOpen = !IsSlidebarOpen;
                          });
                        }),
                    Menuitem(
                        title: "theme",
                        icon: Icons.theater_comedy,
                        ontap: () {
                          context
                              .bloc<Navigationbloc>()
                              .add(Navigationevent.theme);
                          setState(() {
                            IsSlidebarOpen = !IsSlidebarOpen;
                          });
                        })
                  ],
                )),
            GestureDetector(
              onTap: () {
                setState(() {
                  IsSlidebarOpen = !IsSlidebarOpen;
                });
              },
              child: Align(
                  alignment: Alignment(0, -0.8),
                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      alignment: Alignment.center,
                      color: Color(0xff262aaa),
                      child: new AnimatedIcon(
                          size: 25,
                          color: Color(0xff1bb5fd),
                          icon: !IsSlidebarOpen
                              ? AnimatedIcons.menu_close
                              : AnimatedIcons.close_menu,
                          progress: _animationcontroller.view),
                    ),
                  )),
            )
          ],
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(width, 0);
    path.quadraticBezierTo(width, 8, width - 10, 16);
    path.quadraticBezierTo(0, width, 0, height / 2);
    path.quadraticBezierTo(0, height - width, width - 10, height - 16);
    path.quadraticBezierTo(width, height - 8, width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
