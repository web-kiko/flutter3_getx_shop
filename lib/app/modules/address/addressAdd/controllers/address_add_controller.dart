import 'package:get/get.dart';

class AddressAddController extends GetxController {
  RxString area = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setArea(String str) {
    area.value = str;
    update();
  }
}