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



}