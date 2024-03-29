import 'package:get/get.dart';

import '../controllers/on_step_login_controller.dart';

class OnStepLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnStepLoginController>(
      () => OnStepLoginController(),
    );
  }
}
