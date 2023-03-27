import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/app_colors.dart';

class AreYouReady extends StatelessWidget {
  const AreYouReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
        create: (context)=>TimerModel(),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/2 - 100,),
                Text("ARE YOU\n READY",
                textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'sanFrancis',

                        fontWeight: FontWeight.w900),),
                SizedBox(height: 25,),
                Consumer<TimerModel>(
                    builder: (context,myModel,child)=>Text(
                        "0${myModel.countdown}",
                        style: TextStyle(
                            fontSize: 66,
                            fontFamily: 'SanFrancisco',
                            fontWeight: FontWeight.w900,
                            color: AppColors.appBarColor))),
                Spacer(),
                Divider(thickness: 2,),
                Align(
                  widthFactor: 4,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10,bottom: 15),
                    child: Text("Next : Anulom Vilom",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'SanFrancisco',
                        fontWeight: FontWeight.w200),),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier{
  TimerModel(){
    MyTimer();
  }
  int countdown = 5;

   MyTimer()async{
     Timer.periodic(Duration(seconds: 1), (timer) {
       countdown--;
       notifyListeners();
       if(countdown == 0){
         timer.cancel();
       }
     });
   }

}




