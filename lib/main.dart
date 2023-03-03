// ignore_for_file: prefer_const_constructors

import 'package:application/l10n/Language.dart';
import 'package:application/widgets/home/HomeWidget.dart';
import 'package:application/widgets/language/LanguageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //rootBundle.loadStructuredData("");
    return GetMaterialApp(
      title: "标题",
      translations: Language(),
      locale: Locale('zh', 'CN'), //设置默认语言
      fallbackLocale: Locale("zh", "CN"), // 在配置错误的情况下,使用的语言
      home: LanguageWidget(),
      getPages: [
        GetPage(name: '/', page: () => HomeWidget()),
        GetPage(name: '/language', page: () => LanguageWidget()),
      ],
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("new page"),
            CupertinoButton(
                child: const Text("按钮"),
                onPressed: () {
                  Get.defaultDialog(title: "test", middleText: "test");
                }),
          ],
        ),
      ),
    );
  }
}
