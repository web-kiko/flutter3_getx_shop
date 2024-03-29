import 'package:get/get.dart';

import '../controllers/code_login_step_two_controller.dart';

class CodeLoginStepTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeLoginStepTwoController>(
      () => CodeLoginStepTwoController(),
    );
  }
}
