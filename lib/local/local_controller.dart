import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MylLocalController extends GetxController {
  void changeLang(codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
  }
}
