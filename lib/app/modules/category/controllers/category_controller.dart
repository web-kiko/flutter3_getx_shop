import 'package:get/get.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

   RxInt  selectIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index) {
    selectIndex.value=index;
    update();
  }
}