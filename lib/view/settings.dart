import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_to_speech/controller/controller.dart';
import 'package:text_to_speech/local/local_controller.dart';
import '../components.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    MylLocalController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('9'.tr),
      ),
      body: GetBuilder<Primary>(
        builder: ((controller) => Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4'.tr,
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          GetBuilder<Primary>(
                            builder: (controller) => ChoiceChip(
                              disabledColor: Colors.white,
                              label: Text('7'.tr),
                              selectedColor: PrimaryC,
                              selected: controller.isSelectedArabic.value,
                              onSelected: (newBoolValue) {
                                setState(() {
                                  controller.isSelectedArabic.value =
                                      newBoolValue;
                                  controller.isSelectedEnglish = false.obs;
                                });
                                controller.setLanguageArabic();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GetBuilder<Primary>(
                            builder: (controller) => ChoiceChip(
                              disabledColor: Colors.white,
                              selectedColor: PrimaryC,
                              label: Text('8'.tr),
                              selected: controller.isSelectedEnglish.value,
                              onSelected: (newBoolValue) {
                                setState(() {
                                  controller.isSelectedEnglish.value =
                                      newBoolValue;
                                  controller.isSelectedArabic = false.obs;
                                });
                                controller.setLanguageEngilsh();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Text(
                        '5'.tr,
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          GetBuilder<Primary>(
                            builder: (controller) => ChoiceChip(
                              disabledColor: Colors.white,
                              label: Text('7'.tr),
                              selectedColor: PrimaryC,
                              selected: controller.isLangSelectedArabic.value,
                              onSelected: (lanBoolValue) {
                                setState(() {
                                  controller.isLangSelectedArabic.value =
                                      lanBoolValue;
                                  controller.isLangSelectedEnglish.value =
                                      false;
                                  controllerLang.changeLang('ar');
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GetBuilder<Primary>(
                            builder: (controller) => ChoiceChip(
                              disabledColor: Colors.white,
                              selectedColor: PrimaryC,
                              label: Text('8'.tr),
                              selected: controller.isLangSelectedEnglish.value,
                              onSelected: (lanBoolValue) {
                                setState(() {
                                  controller.isLangSelectedEnglish.value =
                                      lanBoolValue;
                                  controller.isLangSelectedArabic.value = false;
                                  controllerLang.changeLang('en');
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('6'.tr, style: TextStyle(fontSize: 32)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${controller.pitch.toStringAsFixed(1)}',
                              style: TextStyle(fontSize: 22)),
                        ],
                      ),
                      Row(
                        children: [
                          GetBuilder<Primary>(
                            init: Get.put(Primary(), permanent: true),
                            builder: (controller) => Expanded(
                              child: Slider(
                                  max: 2.0,
                                  min: 1.0,
                                  value: controller.pitch,
                                  onChanged: (double value) {
                                    setState(() {
                                      controller.pitch = value;
                                      controller.setPitch(controller.pitch);
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )),
      ),
    );
  }
}
