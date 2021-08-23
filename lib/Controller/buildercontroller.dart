import 'package:get/get.dart';

class BuilderController extends GetxController {
  String firstText = "First Text";
  int count = 0;

  void changeFirstText() {
    count++;
    firstText = "Text Changed $count";
    update();
  }
}
