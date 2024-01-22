import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": {"Fresh Home": "Fresh Home"},
        "ar": {"Fresh Home": "المنزل الطازجة"}
      };
}
