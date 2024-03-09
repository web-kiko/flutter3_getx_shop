import 'package:get/get.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
