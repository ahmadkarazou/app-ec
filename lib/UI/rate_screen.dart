import 'package:flutter/material.dart';

import '../widget/button.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  int rate = 1;

  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        title: Text(
          'Share your feedback',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: hei * 0.1),
            Text(
              'What is your opinion of GemStore?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: hei * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        rate = 1;
                      });
                    },
                    icon: Icon(Icons.star_rate,
                        size: 45,
                        color: (rate >= 1) ? Colors.amber : Colors.grey)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        rate = 2;
                      });
                    },
                    icon: Icon(Icons.star_rate,
                        size: 45,
                        color: (rate >= 2) ? Colors.amber : Colors.grey)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        rate = 3;
                      });
                    },
                    icon: Icon(Icons.star_rate,
                        size: 45,
                        color: (rate >= 3) ? Colors.amber : Colors.grey)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        rate = 4;
                      });
                    },
                    icon: Icon(Icons.star_rate,
                        size: 45,
                        color: (rate >= 4) ? Colors.amber : Colors.grey)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        rate = 5;
                      });
                    },
                    icon: Icon(Icons.star_rate,
                        size: 45,
                        color: (rate >= 5) ? Colors.amber : Colors.grey)),
              ],
            ),
            SizedBox(height: hei * 0.1),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText:
                      'Would you like to write anything about this product?',
                ),
                maxLines: 7,
              ),
            ),
            SizedBox(height: hei * 0.05),
            ElevatedButton(
              onPressed: () {},
              style: buttonPrimary,
              child: const Text('Send feedback',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    ));
  }
}
