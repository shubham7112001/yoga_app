import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/NetworkDataUrl/network_data_url.dart';

import '../Utils/app_colors.dart';
import 'break_time_screen.dart';

class WorkOutDetails extends StatelessWidget {
 WorkOutDetails({Key? key}) : super(key: key);

  final TextStyle style60 = TextStyle(fontSize: 60,fontWeight: FontWeight.bold,fontFamily: 'SanFrancisco',color: Colors.white);
  final TextStyle style = TextStyle(fontWeight: FontWeight.bold,fontFamily: 'SanFrancisco',color: Colors.white);
  final TextStyle style30 = TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'SanFrancisco',color: Colors.white);
  final TextStyle styleResume = TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'SanFrancisco');


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_TimerModel>(
        create: (context)=>_TimerModel(context),
      child: Scaffold(
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    //GIF Container
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(NetworkDataUrl.defaultGifUrl)
                        )
                      ),
                    ),
                    Spacer(),
                    Text("Anulom Vilom",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'SanFrancisco'),),
                    Spacer(),
                    //Timer Container
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.appBarColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Consumer<_TimerModel>(builder: (context,myModel,child){
                        return Text((myModel.countdown>9)?"00 : ${myModel.countdown}":"00 : 0${myModel.countdown}",style: TextStyle(fontSize: 60,fontFamily: 'SanFrancisco',color: Colors.white),textAlign: TextAlign.center,);
                      }),
                    ),
                    Spacer(),
                    SizedBox(height: 30,),

                    Consumer<_TimerModel>(builder: (context,myModel,child){
                     return ElevatedButton(
                      onPressed: (){
                        myModel.show();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                          child: Text("PAUSE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'SanFrancisco'),)
                      ),
                    );
                    }),
                    Spacer(),
                    //Previous and Skip Container
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: (){}, child: Text("<< Previous",style: TextStyle(fontSize: 20),)),
                          TextButton(onPressed: (){}, child: Text("Next >>",style: TextStyle(fontSize: 20),)),
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

              // Visible Container on Pause
              Consumer<_TimerModel>(
                builder: (context,myModel,child){
                  return Visibility(
                      visible:myModel.visible ,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.lightBlueAccent.withOpacity(0.93),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //PAUSE
                            Text("Pause",style: style60,),
                            SizedBox(height: 40,),

                            //RESTART
                            OutlinedButton(
                              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                                onPressed: (){},
                                child: Container(
                                  width: 150,
                                  padding: EdgeInsets.all(10),
                                  child: Text("Restart",style: style30,textAlign: TextAlign.center,),
                                )),
                            SizedBox(height: 20,),

                            //QUIT
                            OutlinedButton(
                              // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                                onPressed: (){},
                                child: Container(
                                  width: 150,
                                  padding: EdgeInsets.all(10),
                                  child: Text("Quit",style: style30,textAlign: TextAlign.center,),
                                )),
                            SizedBox(height: 20,),

                            //RESUME
                            OutlinedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                                onPressed: (){
                                  myModel.hide();
                                },
                                child: Container(
                                  width: 150,
                                  padding: EdgeInsets.all(10),
                                  child: Text("Resume",style: styleResume,textAlign: TextAlign.center,),
                                )),
                          ],
                        ),
                      ));
                },
              )
            ],
          )
      ),
    );
  }
}

class _TimerModel with ChangeNotifier{
  _TimerModel(context){
    _MyTimer(context);
  }
  int countdown = 15;
  bool visible = false;

  _MyTimer(context)async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown == 0){
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BreakTimeScreen()));
      }
    });
  }
  void show(){
    visible = true;
    notifyListeners();
  }
  void hide(){
    visible = false;
    notifyListeners();
  }

}

