import 'package:get/get.dart';

import '../../../units/storage.dart';

class CheckoutController extends GetxController {
  RxList checkoutList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getCheckoutData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //获取要结算的商品
  getCheckoutData() async {
    List tempList = await Storage.getData("checkoutList");
    checkoutList.value = tempList;
    update();
  }
}
