import 'package:flutter/material.dart';

void main() {
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
      home:  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/splashscreen.png"),
      ),
    ),
    );
  }
}
