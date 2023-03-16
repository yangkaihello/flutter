// ignore_for_file: prefer_const_constructors

import 'package:application/l10n/Language.dart';
import 'package:application/routes/routes.dart';
import 'package:application/widgets/test/home/HomeWidget.dart';
import 'package:application/widgets/test/language/LanguageWidget.dart';
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
    return GetMaterialApp(
      title: "标题",
      translations: Language(),
      locale: Locale('zh', 'CN'), //设置默认语言
      fallbackLocale: Locale("zh", "CN"), // 在配置错误的情况下,使用的语言
      home: LanguageWidget(),
      getPages: routes([
        GetPage(name: '/', page: () => HomeWidget()),
        GetPage(name: '/language', page: () => LanguageWidget()),
      ]).build(),
    );
  }
}
