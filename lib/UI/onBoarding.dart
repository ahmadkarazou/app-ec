import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../button.dart';
import 'Create.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200.0),
              Container(
                  width:355,
                  height:336 ,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                        'assets/images/FreshHome.jpeg',
                    ),fit: BoxFit.fill
                    )
                  ),
              ),
              SizedBox(height:150,),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Create()));
                },
                child: Text(
                  'Continue', style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
