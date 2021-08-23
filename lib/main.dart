import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controller/buildercontroller.dart';
import 'package:getxdemo/Controller/reactivecontroller.dart';
import 'package:getxdemo/widgets/builderwidget.dart';
import 'package:getxdemo/widgets/reactivewidget.dart';
import 'package:getxdemo/widgets/test.dart';

void main() {
  // final _myReactiveController = Get.put(ReactiveController());
  // final _myBuilderController = Get.put(BuilderController());

  // Get.lazyPut<ReactiveController>(() => ReactiveController());
  // Get.lazyPut<BuilderController>(() => BuilderController());

  // Get.put<ReactiveController>(ReactiveController());
  // Get.put<BuilderController>(BuilderController());

  runApp(GetXDemoApp());
}

class GetXDemoApp extends StatefulWidget {
  @override
  _GetXDemoAppState createState() => _GetXDemoAppState();
}

class _GetXDemoAppState extends State<GetXDemoApp> {
  String state = "";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/TestScreen", page: () => TestScreen()),
      ],
      home: Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "State - $state",
              textAlign: TextAlign.center,
            ),
            Text(
              "Count - ${Get.put(ReactiveController()).count}",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () async {
                state = await Get.toNamed("/TestScreen");
                setState(() {});
              },
              child: Text("Go To Test Named Route"),
            ),
            TextButton(
              onPressed: () async {
                state = await Get.to(ReactiveWidget());
                setState(() {});
              },
              child: Text("Go To Reactive Widget"),
            ),
            TextButton(
              onPressed: () async {
                state = await Get.to(BuilderWidget());
                setState(() {});
              },
              child: Text("Go To Builder Widget"),
            ),
          ],
        )),
      ),
    );
  }
}
