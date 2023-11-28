import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 800,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(
                    'assets/images/06361988-ab1d-48cb-bdc0-8fb7b6b25a04.jpg'),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Sunie Pham',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'sunieux@gmail.com',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          DrawerIcon(
            onTab: () {},
            title: 'Home Pages',
            icon: Icons.home_outlined,
          ),
          SizedBox(height: 10),
          DrawerIcon(
            onTab: () {},
            title: 'My Order',
            icon: Icons.shopping_cart_outlined,
          ),
          SizedBox(height: 10),
          DrawerIcon(
            onTab: () {},
            title: 'My Profile',
            icon: Icons.person_2_outlined,
          ),
          SizedBox(height: 80),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                'OTHER',
                style: TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 30),
          DrawerIcon(
            onTab: () {},
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
          SizedBox(width: 30),
          Icon(
            icon,
            size: 30,
            color: Colors.grey,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          )
        ],
      ),
    );
  }
}
