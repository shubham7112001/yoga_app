import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';

void main()  {
  // await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen()
    );
  }
}
