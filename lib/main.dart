import 'package:flutter/material.dart';
import 'package:text_to_speech/components.dart';
import 'package:text_to_speech/view/home.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/local/local.dart';
import 'package:text_to_speech/local/local_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MylLocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Get.deviceLocale,
      translations: MyLocal(),
      theme: ThemeData(
        primarySwatch: PrimaryC,
      ),
      home: Home(),
    );
  }
}
