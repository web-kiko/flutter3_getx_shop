import 'package:get/get.dart';

import '../controllers/lanya_controller.dart';

class LanyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanyaController>(
      () => LanyaController(),
    );
  }
}
