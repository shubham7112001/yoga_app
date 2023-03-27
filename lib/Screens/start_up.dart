import 'package:flutter/material.dart';
import 'package:yoga_app/NetworkDataUrl/network_data_url.dart';
import 'package:yoga_app/Utils/app_colors.dart';

import 'are_you_ready.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AreYouReady()));
        },
        child: Container(
            padding: EdgeInsets.all(20),
            child: Text("Start",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'SanFrancisco'),)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            expandedHeight: 250,
            backgroundColor: AppColors.appBarColor,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: const Text("Yoga",style: TextStyle(fontSize:25,fontFamily: 'SanFrancisco'),),
                centerTitle: true,
                background: Image.network(
                  NetworkDataUrl.defaultUrl,
                  fit: BoxFit.cover,)),
            actions: [
              IconButton(onPressed: (){}, icon:const Icon(Icons.thumb_up_alt_sharp))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("16 Mins || 26 Workouts",textAlign: TextAlign.left,style: TextStyle(fontSize: 18,fontFamily: 'sanFrancis',fontWeight: FontWeight.w400,),)
                    ],
                  ),
                  Divider(thickness: 2,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context,index)=>Divider(thickness: 2,),
                      itemBuilder: (context,index)=>ListTile(
                        leading: Container(
                          padding: EdgeInsets.only(right: 20),
                            child: Image.network(NetworkDataUrl.defaultGifUrl)),
                        title: Text("Yoga ${index+1}",style: TextStyle(fontSize: 18,fontFamily: 'sanFrancis'),),
                        subtitle: (index%2 == 0)
                            ?Text("00 : 20",style: TextStyle(fontSize: 16,fontFamily: 'sanFrancis'))
                            : Text("2x : 20",style: TextStyle(fontSize: 16,fontFamily: 'sanFrancis')),
                      ),
                      itemCount: 25)
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
