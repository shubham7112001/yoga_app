import 'package:flutter/material.dart';

import '../Utils/text_type.dart';
class CustomAppBar extends StatelessWidget {

  AnimationController animationController;
  Animation colorTween, homeTween, yogaTween, iconTween, drawerTween;
  Function() onPressed;

  CustomAppBar({
   required this.animationController,
   required this.colorTween,
   required this.homeTween,
   required this.yogaTween,
   required this.iconTween,
   required this.drawerTween,
   required this.onPressed
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context,child)=>AppBar(
          leading: IconButton(
            icon: Icon(Icons.dehaze),
            color: drawerTween.value,
            onPressed: onPressed,
          ),
          backgroundColor: colorTween.value,
          elevation: 0,
          title: Row(
            children: [
              TextType.appBarTitleText("HOME",homeTween.value),
              TextType.appBarTitleText("YOGA",yogaTween.value),
            ],
          ),
          actions: [
            Icon(Icons.notifications,color: iconTween.value,),
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: CircleAvatar(
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
