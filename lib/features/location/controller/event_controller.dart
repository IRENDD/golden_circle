import 'package:get/get.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
