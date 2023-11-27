import 'package:flutter/material.dart';
import 'UI/home.dart';
import 'UI/onBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        useMaterial3: true,
      ),
      home: onBoarding(),
    );
  }
}




