import 'package:get/get.dart';

import '../controllers/watch_controller.dart';

class WatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchController>(
      () => WatchController(),
    );
  }
}
