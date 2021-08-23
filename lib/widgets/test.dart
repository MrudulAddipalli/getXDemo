import "package:flutter/material.dart";
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              Get.back(result: "Came From Test Route Screen");
            },
            child: Text("Go back"),
          ),
        ),
      ),
    );
  }
}
