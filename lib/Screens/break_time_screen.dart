import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakTimeScreen extends StatelessWidget {
  BreakTimeScreen({Key? key}) : super(key: key);
  final TextStyle style40 = TextStyle(fontSize: 40,fontFamily: 'SanFrancisco',fontWeight: FontWeight.bold,color: Colors.white);
  final TextStyle style80 = TextStyle(fontSize: 80,fontFamily: 'SanFrancisco',fontWeight: FontWeight.bold,color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>_TimerModel(context),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text("Break Time",style: style40,),
              // Timer Text
              Consumer<_TimerModel>(builder: (context,myModel,child)=>Text((myModel.countdown>9)?"${myModel.countdown}":"0${myModel.countdown}",style: style80,)),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){},
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                    child: Text("SKIP",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600,fontFamily: 'SanFrancisco'),)
                ),
              ),
              Spacer(),
              //Previous and Next Container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){}, child: Text("<< Previous",style: TextStyle(fontSize: 20,color: Colors.white),)),
                    TextButton(onPressed: (){}, child: Text("Next >>",style: TextStyle(fontSize: 20,color: Colors.white),)),
                  ],
                ),
              ),
              Divider(thickness: 2,),
              //Bottom Text
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
    );
  }
}

class _TimerModel with ChangeNotifier{
  _TimerModel(context){
    _MyTimer(context);
  }
  int countdown = 20;

  _MyTimer(context)async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown == 0){
        timer.cancel();
      }
    });
  }

}
