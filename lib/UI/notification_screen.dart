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
            body: ListView(
              children: [
                NotiCard(wid: wid, hei: hei),
                NotiCard(wid: wid, hei: hei),
                NotiCard(wid: wid, hei: hei),
              ],
            )

            ));
  }
}

class NotiCard extends StatelessWidget {
  const NotiCard({
    super.key,
    required this.wid,
    required this.hei,
  });

  final double wid;
  final double hei;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Container(

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color:Colors.black54,
                      spreadRadius:.1,
                      blurRadius: 2
                  )
                ],
                borderRadius: BorderRadius.circular(20), color: Colors.white),

        width: wid,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage(
                  'assets/images/06361988-ab1d-48cb-bdc0-8fb7b6b25a04.jpg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning! Get 20% Voucher',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                ),
                SizedBox(height: hei * 0.02),
                Text(
                  'Summer sale up to 20% off.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              '12:00',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            //Divider(height: 3, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
