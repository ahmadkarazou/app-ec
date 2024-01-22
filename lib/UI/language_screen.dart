import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../local/locale_controller.dart';
import '../widget/button.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.find();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Language",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: buttonPrimary,
              onPressed: () {
                controller.changeLang("ar");
              },
              child: const Text(
                'Arabic',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: buttonPrimary,
              onPressed: () {
                controller.changeLang("en");
              },
              child: const Text(
                'English',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
