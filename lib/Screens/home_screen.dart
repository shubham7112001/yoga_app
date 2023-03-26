import 'package:flutter/material.dart';

import '../Custom App Bar/custom_app_bar.dart';
import '../widgets/text_widgets.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _yogaTween, _iconTween, _homeTween, _drawerTween, _colorTween;
  late AnimationController _textAnimationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent,end: Colors.white).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white,end: Colors.black).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white,end: Colors.blue).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white,end: Colors.lightBlue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white,end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this,duration: Duration(seconds: 0));
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListener,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(

                              padding: EdgeInsets.fromLTRB(30, 120, 50, 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                color: Colors.blue
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextWidgets.customAppBarBelowColumnText("1", "Streak"),
                                  TextWidgets.customAppBarBelowColumnText("120", "kCal"),
                                  TextWidgets.customAppBarBelowColumnText("35", "Minutes"),
                                ],
                              )
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text("Yoga For All"),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3Vuc2V0JTIweW9nYXxlbnwwfHwwfHw%3D&w=1000&q=80"
                                            )
                                          )
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                    onPressed: (){scaffoldKey.currentState!.openDrawer();},
                    animationController: _animationController,
                    colorTween: _colorTween,
                    drawerTween: _drawerTween,
                    homeTween: _homeTween,
                    iconTween: _iconTween,
                    yogaTween: _yogaTween,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
