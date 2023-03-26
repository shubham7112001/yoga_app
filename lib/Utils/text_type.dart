import 'dart:ui';

import 'package:flutter/material.dart';

class TextType{
   final String s;
   final Color c;

   TextType({
     required this.s ,
     required this.c
   });

     static Widget appBarTitleText(String s,Color c){
     return Text(s,
       style: TextStyle(
           color: c,
           fontSize: 20,
           fontWeight: FontWeight.bold,
       fontFamily: 'SanFrancisco'),);
   }


}