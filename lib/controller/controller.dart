import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

class Primary extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxBool isSelectedArabic = false.obs;
  RxBool isSelectedEnglish = true.obs;

  RxBool isLangSelectedArabic = false.obs;
  RxBool isLangSelectedEnglish = true.obs;
  late double pitch = 1;

  speak(String text) async {
    //await flutterTts.setLanguage('ar-EG');
    //await flutterTts.setPitch(2);
    await flutterTts.speak(textEditingController.text);
  }

  setLanguageArabic() async {
    await flutterTts.setLanguage('ar-EG');
  }

  setLanguageEngilsh() async {
    await flutterTts.setLanguage('en-US');
  }

  setPitch(double pitch) async {
    await flutterTts.setPitch(pitch);
  }
}
