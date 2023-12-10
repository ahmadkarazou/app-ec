import 'package:flutter/material.dart';
import 'package:untitled4/UI/FavouritePage.dart';
import 'package:untitled4/UI/LogIn.dart';
import 'package:untitled4/UI/rate_screen.dart';

import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    String name = 'Sunie Pham';
    String email = 'sunieux@gmail.com';

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
                        name,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email,
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
                            builder: (context) => const EditProfilePage()),
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavoriteScreen(),
                        ));
                      },
                    ),
                    Divider(height: 1, color: Colors.black12),
                    ButtonNut(
                      wid: wid,
                      title: 'Rate This App',
                      icon: Icons.star,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RateScreen(),
                        ));
                      },
                    ),
                    Divider(height: 1, color: Colors.black12),
                    ButtonNut(
                        wid: wid,
                        title: 'Log Out',
                        icon: Icons.exit_to_app,
                        onTap: () {
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
  });

  final double wid;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff74918B),
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
