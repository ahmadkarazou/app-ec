import 'package:flutter/material.dart';
import 'Profile.dart';
import 'UI/home.dart';

void main() {
  runApp( MyApp());

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
      home:const Home(),
    );
  }
}




