import 'package:flutter/material.dart';
import 'package:yoga_app/NetworkDataUrl/network_data_url.dart';

import '../Utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(NetworkDataUrl.defaultUrl)
                )
              ),
            ),

            ListTile(title: Text("Reset Progress",style: Constants.customDrawerStyle),leading: Icon(Icons.restart_alt,size: 25,),),
            ListTile(title: Text("Share With Friends",style: Constants.customDrawerStyle),leading: Icon(Icons.share,size: 25,),),
            ListTile(title: Text("Rate Us",style: Constants.customDrawerStyle),leading: Icon(Icons.star,size: 25,),),
            ListTile(title: Text("FeedBack",style: Constants.customDrawerStyle),leading: Icon(Icons.comment,size: 25,),),
            ListTile(title: Text("Privacy Policy",style: Constants.customDrawerStyle),leading: Icon(Icons.security,size: 25,),),

            Divider(indent: 60,endIndent: 60,thickness: 2),
            Text("Version 1.1.0",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
