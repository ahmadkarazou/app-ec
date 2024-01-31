import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/UI/Create.dart';
import 'package:untitled4/UI/Forgot.dart';
import 'package:untitled4/UI/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';
import '../widget/button.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery
        .of(context)
        .size
        .height;
    double wid = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(height: hei * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(height: hei * 0.1),
                    Text(
                      'Log in to your Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: hei * 0.05),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      //controller: TextEditingController(),
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                      ),
                    ),
                    SizedBox(height: hei * 0.05),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      // controller: TextEditingController(),
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: hei * 0.05),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Forgot()),
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
              ),
              SizedBox(height: hei * 0.05),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    sharedPref.setString('uId', user.user!.uid);
                    print(user.user!.uid);
                    if (user != null) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => Home(),), (
                              route) => false);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: hei * 0.07),
              Text(
                'or log in with',
                style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: hei * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: CircleAvatar(
                      maxRadius: 14,
                      child: Image.asset('assets/images/Apple.jpeg'),
                    ),
                  ),
                  SizedBox(width: wid * 0.05),
                  TextButton(
                    onPressed: () {},
                    child: CircleAvatar(
                      maxRadius: 14,
                      child: Image.asset('assets/images/google.jpeg'),
                    ),
                  ),
                  SizedBox(width: wid * 0.05),
                  TextButton(
                    onPressed: () {},
                    child: CircleAvatar(
                      maxRadius: 14,
                      child: Image.asset('assets/images/facebook.jpeg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: hei * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?',
                      style:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Create()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
