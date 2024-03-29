import 'package:get/get.dart';

import '../controllers/register_step_two_controller.dart';

class RegisterStepTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStepTwoController>(
      () => RegisterStepTwoController(),
    );
  }
}
