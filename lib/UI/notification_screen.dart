import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              width: wid,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Text(
                    'Good morning! Get 20% Voucher',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: hei*0.02),
                  Text(
                    'Summer sale up to 20% off. Limited voucher. Get now!! 😜',
                    style: TextStyle(fontSize: 16, ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              width: wid,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Text(
                    'Special offer just for you',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: hei*0.02),
                  Text(
                    'New Autumn Collection 30% off',
                    style: TextStyle(fontSize: 16, ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              width: wid,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Text(
                    'Holiday sale 50%',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: hei*0.02),
                  Text(
                    'Tap here to get 50% voucher.',
                    style: TextStyle(fontSize: 16, ),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
