import 'package:flutter/material.dart';

import '../Custom App Bar/custom_app_bar.dart';

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
                            Container(height: 1000,color: Colors.blue,),
                            Container(height: 1000,color: Colors.red,),
                            Container(height: 1000,color: Colors.green,),
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
