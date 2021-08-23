import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controller/buildercontroller.dart';

class BuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GetBuilder<BuilderController>(builder: (_dummyController) {
                return Column(
                  children: [
                    Text(
                      "Reactive GetBuilder- ${_dummyController.firstText}",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Count ${_dummyController.count}",
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        _dummyController.changeFirstText();
                      },
                      child: Text("Change Text"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back(result: "Came From Builder Widgert");
                      },
                      child: Text("Go back"),
                    ),
                  ],
                );
              }),

              //
            ],
          ),
        ),
      ),
    );
  }
}
