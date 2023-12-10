import 'package:flutter/material.dart';
import 'package:untitled4/modal/button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffFFFBFE),
          leading: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: hei * 0.05),
              const Text(
                'Profile Setting',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: hei * 0.05),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage(
                        'assets/images/06361988-ab1d-48cb-bdc0-8fb7b6b25a04.jpg'),
                  ),
                  Positioned(
                    bottom: .1,
                    right: 1,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff74918B),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined,size: 18,)),
                    ),
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'First Name'),
                          ),
                        ),
                        SizedBox(width: wid * 0.05),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Last Name'),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Gender'),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: buttonPrimary,
                child: const Text('Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
