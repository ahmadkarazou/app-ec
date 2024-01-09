import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/UI/LogIn.dart';
import 'package:untitled4/UI/home.dart';
import 'package:untitled4/UI/onBoarding.dart';
import 'package:untitled4/firebase_options.dart';

import 'UI/FavouritePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      debugShowCheckedModeBanner: false,
      home: UserLogin(),
    );
  }
}

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data ?? OnBoarding();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<Widget> _checkUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    String? user = shared.getString('uId');

    if (user == null) {
      return OnBoarding();
    } else if (user == '') {
      return LogIn();
    } else {
      return Home();
    }
  }
}

