import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled4/UI/language_screen.dart';

import '../local/locale_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var label= 'Language';
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.find();
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    var label= 'Language';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(238, 114, 100, 1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: hei * 0.02),
            DropdownButton(
              style: TextStyle(color: Colors.black,fontSize: 24),
              autofocus: true,
              hint:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                     maxRadius: 30,
                      backgroundColor: Color.fromRGBO(238, 114, 100, .25),
                      child: Icon(
                        Icons.language,
                        size: 30,
                        color: Color.fromRGBO(238, 114, 100, 1),
                      ),
                    ),
                   SizedBox(width: wid * 0.05),
                    Text(
                      'Language',
                      style: TextStyle(
                          color: Color.fromRGBO(238, 114, 100, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: wid * 0.15),
                  ],
                ),
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(238, 114, 100, .25),
                ),
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color.fromRGBO(238, 114, 100, 1),
                ),
              ),
              items: ['Arabic', 'English']
                  .map((e) => DropdownMenuItem(
                child: Text("$e"),
                value: e,
              ))
                  .toList(),
              onChanged: (val) {
                if (val == 'Arabic') {
                  controller.changeLang("ar");
                }
                if (val == 'English') {
                  controller.changeLang("en");
                }
              },

              value: null,

            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Notification',
              icon: Icons.notifications_outlined,
              backColor: Color.fromRGBO(238, 114, 100, .25),
              iconColor: Color.fromRGBO(238, 114, 100, 1),
            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Terms of Use',
              icon: Icons.speaker_notes_outlined,
              backColor: Color.fromRGBO(238, 114, 100, .25),
              iconColor: Color.fromRGBO(238, 114, 100, 1),
            ),
            SizedBox(height: hei * 0.02),
            Divider(height: 2, color: Colors.black12),
            SizedBox(height: hei * 0.02),
            ButtonWidget(
              wid: wid,
              onTap: () {},
              title: 'Pricavy Policy',
              icon: Icons.info_outlined,
              backColor: Color.fromRGBO(238, 114, 100, .25),
              iconColor: Color.fromRGBO(238, 114, 100, 1),
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
    required this.backColor,
    required this.iconColor,
  });

  final double wid;
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final Color backColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: wid * 0.02),
              CircleAvatar(
                minRadius: 25,
                backgroundColor: backColor,
                child: Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
              ),
              SizedBox(width: wid * 0.05),
              Text(
                title,
                style: TextStyle(
                    color: Color.fromRGBO(238, 114, 100, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(238, 114, 100, .25),
            ),
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Color.fromRGBO(238, 114, 100, 1),
            ),
          )
        ],
      ),
    );
  }
}
