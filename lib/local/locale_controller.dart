import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class LocaleController extends GetxController {

Locale intialLang =sharedPref.getString("lang")==null?Get.deviceLocale!:Locale(sharedPref.getString("lang")!);
  void changeLang(String codeLang)async {
    Locale locale = Locale(codeLang);

    sharedPref!.setString("lang",codeLang);
    Get.updateLocale(locale);
  }
}
