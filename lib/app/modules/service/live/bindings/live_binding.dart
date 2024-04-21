import 'package:get/get.dart';

import '../controllers/live_controller.dart';

class LiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveController>(
      () => LiveController(),
    );
  }
}
