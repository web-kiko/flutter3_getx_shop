import 'package:get/get.dart';

import '../controllers/register_step_one_controller.dart';

class RegisterStepOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStepOneController>(
      () => RegisterStepOneController(),
    );
  }
}
