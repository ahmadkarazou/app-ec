import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/UI/home.dart';

import '../widget/button.dart';
import 'LogIn.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late String email;
  late String password;
  late String name;
  late String gender;
  late String phoneNumber;


  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: hei * 0.05),
              const Text(
                'Create your Account',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: hei * 0.03),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Enter your name',
                        ),
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(height: hei * 0.03),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Enter Email Address',
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: hei * 0.03),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter Password',
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(height: hei * 0.03),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Enter Gender',
                        ),
                        onChanged: (value) {
                          gender = value;
                        },
                      ),
                      SizedBox(height: hei * 0.03),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter Phone Number',
                        ),
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () async {
                  print('$email -----$password ------$name');
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                   SharedPreferences shared=await  SharedPreferences.getInstance();
                      shared.setString('uId', newUser.user!.uid);
                      print('====================================${shared.getString('uId')}');
                    if (newUser != null) {
                      FirebaseFirestore.instance
                          .collection('User')
                          .doc(newUser.user?.uid)
                          .set({
                        'Name': name,
                        'Email':email,
                        'Password':password,
                        'gender':gender,
                        'phoneNumber':phoneNumber,
                      });
                    }
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                      (route) => false,
                    );
                  } catch (e) {
                    print('Error during sign-in:');
                    print(e);
                  }
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: hei * 0.07),
              const Text(
                'or sign up with',
                style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
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
                  const Text('Already have an account?',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()));
                      },
                      child: const Text('Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              decoration: TextDecoration.underline)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
