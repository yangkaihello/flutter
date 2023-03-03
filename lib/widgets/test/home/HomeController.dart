// ignore_for_file: file_names

import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update(['jimi_count']);
  }

  void incrementNotName() {
    count++;
    update();
  }
}
