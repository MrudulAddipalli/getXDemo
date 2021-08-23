import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controller/reactivecontroller.dart';

class ReactiveWidget extends StatefulWidget {
  @override
  _ReactiveWidgetState createState() => _ReactiveWidgetState();
}

class _ReactiveWidgetState extends State<ReactiveWidget> {
  final _myReactiveController = Get.put(ReactiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GetX<ReactiveController>(
                init: ReactiveController(),
                builder: (_reactiveController) {
                  return Text(
                    "Reactive GetX- ${_reactiveController.firstText.value}",
                    textAlign: TextAlign.center,
                  );
                },
              ),

              // //
              Obx(() {
                return Column(
                  children: [
                    Text(
                      "Reactive Obx- ${_myReactiveController.firstText.value}",
                      textAlign: TextAlign.center,
                    ),

                    // For Non .obs variable, it is updating only because of Obx()
                    Text(
                      "Non obs Count With Obx Wrapper ${_myReactiveController.count}",
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }),

              // For Non .obs variable , it will not work
              // Obx(() => Text(
              //       "Count With Obx ${_myReactiveController.count}",
              //       textAlign: TextAlign.center,
              //     )),

              // For Non .obs variable, it will update only with setState();
              Text(
                "Non obs Count Without Obx And With setState() ${_myReactiveController.count}",
                textAlign: TextAlign.center,
              ),

              TextButton(
                onPressed: () {
                  _myReactiveController.changeFirstText();
                  setState(() {});
                },
                child: Text("Change Text"),
              ),

              //

              TextButton(
                onPressed: () {
                  Get.back(result: "Came From Reactive Widgert");
                },
                child: Text("Go back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
