import 'dart:math';

import 'package:get/get.dart';

class ReactiveController extends GetxController {
  var firstText = "First Text".obs;
  var count = 0;

  void changeFirstText() {
    print("Called");
    count = count + 1;
    firstText.value = "Text Changed ${Random().nextInt(6) + 1}";
    // count.update((val) {
    //   if (val != null) count = count + 1;
    // });
    // firstText.update((str) {
    //   firstText.value = "Text Changed $count";
    // });
  }
}
