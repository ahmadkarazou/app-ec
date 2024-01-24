import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/UI/Profile.dart';
import 'package:untitled4/UI/home.dart';

import '../UI/setting_screen.dart';

class DrawerApp extends StatefulWidget {
  DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  String name = "";

  String email = "";

  @override
  void initState() {
    GetData();
  }

  GetData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String uId = shared.getString('uId')!;
    FirebaseFirestore.instance.collection('User').doc(uId).get().then((value) {
      setState(() {
        email = value["Email"].toString();
        print(email);
        name = value["Name"].toString();
        print(name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 800,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              const CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(
                    'assets/images/06361988-ab1d-48cb-bdc0-8fb7b6b25a04.jpg'),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          DrawerIcon(
            onTab: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(selectedindex: 0),
              ));
            },
            title: 'Home Pages',
            icon: Icons.home_outlined,
          ),
          SizedBox(height: 10),
          DrawerIcon(
            onTab: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(selectedindex: 1),
              ));
            },
            title: 'My Cart',
            icon: Icons.shopping_cart_outlined,
          ),
          SizedBox(height: 10),
          DrawerIcon(
            onTab: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(selectedindex: 2),
              ));
            },
            title: 'My Profile',
            icon: Icons.person_2_outlined,
          ),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                'OTHER',
                style: TextStyle(
                    color: Color.fromRGBO(238, 114, 100, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          DrawerIcon(
            onTab: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingScreen(),
              ));
            },
            title: 'Setting',
            icon: Icons.settings_outlined,
          ),
          SizedBox(height: 10),
          DrawerIcon(
            onTab: () {},
            title: 'Support',
            icon: Icons.mail_outline,
          ),
          SizedBox(height: 10),
          DrawerIcon(
            onTab: () {},
            title: 'About us',
            icon: Icons.info_outlined,
          ),
        ],
      ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  DrawerIcon({
    super.key,
    required this.onTab,
    required this.icon,
    required this.title,
  });

  VoidCallback onTab;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTab,
      child: Row(
        children: [
          SizedBox(width: 20),
          CircleAvatar(
            backgroundColor:Color.fromRGBO(238, 114, 100, 0.25) ,
            maxRadius: 22,
            child: Icon(
              icon,
              size: 25,
              color:Color.fromRGBO(238, 114, 100, 1),
            ),
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(238, 114, 100, 1),
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
