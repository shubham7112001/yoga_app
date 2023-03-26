import 'package:flutter/material.dart';

import '../Utils/constants.dart';
class TextWidgets{
  final String upperText;
  final String lowerText;

  TextWidgets({
    required this.upperText ,
    required this.lowerText ,
});


  static Column customAppBarBelowColumnText(String upperText,String lowerText){
    return Column(
      children: [
        Text(upperText,style: Constants.styleAppBarUpper30,),
        SizedBox(height: 4,),
        Text(lowerText,style: Constants.styleAppBarLower13,),

      ],
    );
  }

  static Widget yogaForAllText({String? text}){
    return Padding(
      padding: const EdgeInsets.only(bottom:8,left: 8,top: 12),
      child: Text(text ?? "Yoga For All",style: TextStyle(fontSize:16,fontFamily: 'SanFrancisco'),),
    );
  }



}