import 'package:flutter/material.dart';

import '../button.dart';
import 'Create.dart';

class onBoarding extends StatelessWidget {
  onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: hei * 0.25),
             const Image(
                image: AssetImage(
                  'assets/images/FreshHome.jpeg',
                ),
              ),
              SizedBox(height: hei * 0.25),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Create(),
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
