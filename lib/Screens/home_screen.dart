import 'package:flutter/material.dart';
import 'package:yoga_app/Data/models/yoga_model.dart';
import 'package:yoga_app/Data/models/yoga_summary_model.dart';
import 'package:yoga_app/Screens/start_up.dart';
import 'package:yoga_app/widgets/home_screen_container.dart';
import '../CustomWidgets/custom_app_bar.dart';
import '../CustomWidgets/custom_drawer.dart';
import '../Utils/app_colors.dart';
import '../services/yoga_db.dart';
import '../widgets/text_widgets.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _yogaTween, _iconTween, _homeTween, _drawerTween, _colorTween;
  late AnimationController _textAnimationController;

  Future makeYogaEntry(Yoga yoga,String tableName) async{
    await YogaDatabase.instance.insert(yoga, tableName);
  }

  Future makeYogaSummaryEntry(YogaSummary yogaSummary) async{
    await YogaDatabase.instance.insertYogaSummary(yogaSummary);
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent,end: Colors.white).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white,end: Colors.black).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white,end: Colors.blue).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white,end: Colors.lightBlue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white,end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this,duration: Duration(seconds: 0));
    super.initState();


    // CREATING ONE YOGA WORKOUT PACK
    makeYogaSummaryEntry(YogaSummary(YogaWorkOutName: YogaModel.YogaTable1, BackImg: "BACKIMGURL", TimeTaken: "36", TotalNoOfWorkOut: "12"));
    makeYogaEntry(Yoga(Seconds: true, YogaTitle: "DummyUrl", YogaImgUrl: "Anulom Vilom"), YogaModel.YogaTable1);
    makeYogaEntry(Yoga(Seconds: true, YogaTitle: "DummyUrl1", YogaImgUrl: "KapalBhati"), YogaModel.YogaTable1);
    makeYogaEntry(Yoga(Seconds: true, YogaTitle: "DummyUrl2", YogaImgUrl: "Pranayam"), YogaModel.YogaTable1);
    makeYogaEntry(Yoga(Seconds: true, YogaTitle: "DummyUrl3", YogaImgUrl: "Shwasari"), YogaModel.YogaTable1);

  }

  bool scrollListener(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: AppColors.mainColor,
      body: NotificationListener(
        onNotification: scrollListener,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(

                              padding: EdgeInsets.fromLTRB(30, 130, 50,30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                color: AppColors.appBarColor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextWidgets.customAppBarBelowColumnText("1", "Streak"),
                                  TextWidgets.customAppBarBelowColumnText("120", "kCal"),
                                  TextWidgets.customAppBarBelowColumnText("35", "Minutes"),
                                ],
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidgets.yogaForAllText(),
                                  InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const StartUp())),
                                      child: HomeScreenContainer.homeScreenContainerInsideStack(),),
                                  
                                  

                                  HomeScreenContainer.homeScreenContainerInsideStack(),
                                  TextWidgets.yogaForAllText(),
                                  HomeScreenContainer.homeScreenContainerInsideStack(),
                                  HomeScreenContainer.homeScreenContainerInsideStack(),
                                  HomeScreenContainer.homeScreenContainerInsideStack(),
                                  TextWidgets.yogaForAllText(),
                                  HomeScreenContainer.homeScreenContainerInsideStack(),
                                  HomeScreenContainer.homeScreenContainerInsideStack(),
                                  HomeScreenContainer.homeScreenContainerInsideStack(),

                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                    onPressed: (){scaffoldKey.currentState!.openDrawer();},
                    animationController: _animationController,
                    colorTween: _colorTween,
                    drawerTween: _drawerTween,
                    homeTween: _homeTween,
                    iconTween: _iconTween,
                    yogaTween: _yogaTween,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
