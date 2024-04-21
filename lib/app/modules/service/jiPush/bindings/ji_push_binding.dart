import 'package:get/get.dart';

import '../controllers/ji_push_controller.dart';

class JiPushBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JiPushController>(
      () => JiPushController(),
    );
  }
}
