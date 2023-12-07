import 'package:flutter/material.dart';
import 'package:untitled4/UI/LogIn.dart';

import '../modal/button.dart';




class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: hei * 0.25),
              SizedBox(
                height: hei * .35,
                child: const Image(
                  image: AssetImage(
                    'assets/images/FreshHome.jpeg',
                  ),
                ),
              ),
              SizedBox(height: hei * 0.25),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
