import 'package:flutter/material.dart';

import '../button.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.0,),
              Center(
                  child: Column(
                    children: [
                      Text('Create new password',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24),),
                      SizedBox(height:10.0),
                      Text('your password must be different \n from previously used password'),
                    ],
                  )
              ),
              SizedBox(height: 20.0),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        controller:TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'New password',
                        ),
                      ),
                      SizedBox(height:20),
                      TextField(
                        controller:TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:60),
              Center(
                child: ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  NewPassword()));
                  },
                  child: Text(
                    'Confirm', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}


