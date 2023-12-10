import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Language',
              icon: Icons.language,
            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Notification',
              icon: Icons.notifications_outlined,
            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Terms of Use',
              icon: Icons.speaker_notes_outlined,
            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Pricavy Policy',
              icon: Icons.info_outlined,
            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
          ],
        ),
      ),
    ));
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.wid,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final double wid;
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.black,
              ),
              SizedBox(width: wid * 0.05),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
