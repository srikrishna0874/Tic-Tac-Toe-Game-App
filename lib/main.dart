import 'package:flutter/material.dart';
import 'package:tic_tac_toe/splash_start.dart';
import 'home.dart';

void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashStart(),
    );
  }
}
