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
                      decoration: BoxDecoration(
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
                    ElevatedButton(
                      onPressed: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                          child: Text("PAUSE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'SanFrancisco'),)
                      ),
                    ),
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
              Visibility(
                  visible:true ,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.lightBlueAccent.withOpacity(0.88),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pause",style: style60,),
                        OutlinedButton(
                            onPressed: (){},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Restart",style: style,),
                        ))
                      ],
                    ),
                  ))
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

}

