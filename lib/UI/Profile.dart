import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/UI/FavouritePage.dart';
import 'package:untitled4/UI/LogIn.dart';
import 'package:untitled4/UI/rate_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  String name = "";
  String email = "";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    GetData();
  }

  Future GetData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String uId = shared.getString('uId')!;
    FirebaseFirestore.instance.collection('User').doc(uId).get().then((value) {
      setState(() {
        widget.email = value["Email"].toString();
        widget.name = value["Name"].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: hei * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                        'assets/images/06361988-ab1d-48cb-bdc0-8fb7b6b25a04.jpg'),
                  ),
                  //const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                    icon: Icon(
                      Icons.settings,
                      size: 40,
                      color: Color(0xff74918B),
                    ),
                  ),
                ],
              ),
              SizedBox(height: hei * 0.1),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ButtonNut(
                      wid: wid,
                      title: 'My Wishlist',
                      icon: Icons.favorite,
                      iconColor: Colors.red,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavoriteScreen(),
                        ));
                      },
                    ),
                    SizedBox(height: hei * 0.01),
                    Divider(height: 1, color: Colors.black12),
                    SizedBox(height: hei * 0.01),
                    ButtonNut(
                      wid: wid,
                      title: 'Rate This App',
                      icon: Icons.star,
                      iconColor: Colors.amber,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RateScreen(),
                        ));
                      },
                    ),
                    SizedBox(height: hei * 0.01),
                    Divider(height: 1, color: Colors.black12),
                    SizedBox(height: hei * 0.01),
                    ButtonNut(
                        wid: wid,
                        title: 'Log Out',
                        icon: Icons.exit_to_app,
                        iconColor: Colors.green,
                        onTap: () async {
                          _auth.signOut();
                          SharedPreferences shared =
                              await SharedPreferences.getInstance();
                          shared.setString('uId', '');

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
                              ),
                              (route) => false);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonNut extends StatelessWidget {
  const ButtonNut({
    super.key,
    required this.wid,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.iconColor,
  });

  final double wid;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          SizedBox(width: wid * 0.05),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
