import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AreYouReady extends StatelessWidget {
  const AreYouReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
        create: (context)=>TimerModel(),
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("ARE YOU READY",style: TextStyle(fontSize: 60),),
              Consumer<TimerModel>(builder: (context,myModel,child)=>Text("${myModel.countdown}"))
            ],
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




