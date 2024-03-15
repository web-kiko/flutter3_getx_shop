import 'package:get/get.dart';

import '../controllers/serach_controller.dart';

class SerachBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SerachController>(
      () => SerachController(),
    );
  }
}
