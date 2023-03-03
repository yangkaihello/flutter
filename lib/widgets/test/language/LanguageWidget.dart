// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, avoid_web_libraries_in_flutter

import 'package:application/l10n/Translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  void changeLanguage(String languageCode, String countryCode) {
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}

class LanguageWidget extends StatelessWidget {
  MessagesController messagesController = Get.put(MessagesController());

  LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internationalization"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Translation.HELLO_WORLD.tr,
                style: TextStyle(color: Colors.pink, fontSize: 30)),
            ElevatedButton(
                onPressed: () => messagesController.changeLanguage('zh', "CN"),
                child: Text("切换到中文")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => messagesController.changeLanguage('en', "US"),
                child: Text("切换到英文")),
          ],
        ),
      ),
    );
  }
}
