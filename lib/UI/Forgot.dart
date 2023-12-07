import 'package:flutter/material.dart';
import 'package:untitled4/UI/NewPassword.dart';

import '../modal/button.dart';



class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: hei * 0.05),
              Column(
                children: [
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: hei * 0.02),
                  const Text(
                      'Enter email associated with your account \n and we’ll send and email with instructions to \n reset your password'),
                  SizedBox(height: hei * 0.05),
                  TextField(
                    controller: TextEditingController(),
                    decoration:const InputDecoration(
                      hintText: 'Email Address',
                    ),
                  ),
                  SizedBox(height: hei * 0.2),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>const NewPassword()));
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
