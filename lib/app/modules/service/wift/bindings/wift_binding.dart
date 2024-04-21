import 'package:get/get.dart';

import '../controllers/wift_controller.dart';

class WiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WiftController>(
      () => WiftController(),
    );
  }
}
