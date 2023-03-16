// ignore_for_file: camel_case_types

import 'package:application/abstracts/BaseWidget.dart';
import 'package:application/abstracts/GetPageNew.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class routes {
  final List<GetPage<dynamic>> list;

  routes(this.list);

  List<GetPage<dynamic>> build() {
    for (var i = 0; i < list.length; i++) {
      Widget page = list[i].page();
      Widget? elementBuild;

      if (page is! BaseWidget) {
        continue;
      }

      if (page is StatefulWidget) {
        elementBuild = page.createElement().build();
      } else if (page is StatelessWidget) {
        elementBuild = page.createElement().build();
      }

      print(elementBuild);

      list[i] = list[i].copy(page: (() => page));
    }
    return list;
  }
}
