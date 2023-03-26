import 'package:flutter/material.dart';

import '../NetworkDataUrl/network_data_url.dart';

class HomeScreenContainer{
  final String upperText;
  final String lowerText;
  final String url;
  HomeScreenContainer({
    this.upperText = "Yoga For Beginners",
    this.lowerText = "Last Time : 26 March 2023",
    this.url = NetworkDataUrl.defaultUrl
});
  static Widget homeScreenContainerInsideStack(
      {String? urlStr, String? upperTxt, String? lowerTxt}){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(urlStr ?? NetworkDataUrl.defaultUrl)
                )
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26
            ),
          ),
          Positioned(
              left: 16,
              top: 16,
              child: Text(upperTxt ?? "Yoga For Beginners",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'SanFrancisco'),)),
          Positioned(
              left: 20,
              top:40,
              child: Text(lowerTxt ?? "Last Time : 26 March 2023",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'sanFrancis'),)),
        ],
      ),
    );
  }
}