import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widget/button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Lottie.network(
                    'https://lottie.host/d721608b-7738-4c68-bd50-269003e45953/vlJFDl3s0R.json',
                    height: hei * 0.3,
                  ),

                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
