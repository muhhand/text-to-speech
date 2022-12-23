import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/controller/controller.dart';
import 'package:text_to_speech/local/local_controller.dart';
import 'package:text_to_speech/view/settings.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Settings());
              },
              icon: Icon(Icons.settings))
        ],
        centerTitle: true,
        title: Text('3'.tr),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<Primary>(
          init: Primary(),
          builder: (controller) => Container(
            alignment: Alignment.topCenter,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "1".tr,
                  ),
                  scrollPadding: EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  maxLines: 30,
                  controller: controller.textEditingController,
                ),
              ),
              GetBuilder<Primary>(
                init: Primary(),
                builder: (controller) => Container(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () => controller
                          .speak(controller.textEditingController.text),
                      child: Text(
                        '2'.tr,
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
