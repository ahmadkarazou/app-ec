import 'package:flutter/material.dart';


import '../modal/button.dart';
import 'LogIn.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: hei * 0.05),
             const Text(
                'Create new password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: hei * 0.02),
             const Text(
                  'your password must be different \n from previously used password'),
              SizedBox(height: hei * 0.05),
              TextField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  hintText: 'New password',
                ),
              ),
              SizedBox(height: hei * 0.05),
              TextField(
                controller: TextEditingController(),
                decoration:const InputDecoration(
                  hintText: 'Confirm password',
                ),
              ),
              SizedBox(height: hei * 0.2),
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
                child:const Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
