import 'package:get/get.dart';

import '../controllers/buy_controller.dart';

class BuyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyController>(
      () => BuyController(),
    );
  }
}
