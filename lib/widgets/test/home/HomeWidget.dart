// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application/widgets/test/home/HomeController.dart';

// ignore: must_be_immutable
class HomeWidget extends StatelessWidget {
  HomeController countController = Get.put(HomeController());

  HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Obx---GetXController"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<HomeController>(
              builder: (controller) {
                return Text(
                  "计数器值为: ${controller.count}",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                );
              },
            ),
            GetBuilder<HomeController>(
              id: 'jimi_count',
              builder: (controller) {
                return Text(
                  "计数器值为: ${controller.count}",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => countController.increment(),
                child: Text("增加")),
            ElevatedButton(
                onPressed: () => countController.incrementNotName(),
                child: Text("增加"))
          ],
        ),
      ),
    );
  }
}
