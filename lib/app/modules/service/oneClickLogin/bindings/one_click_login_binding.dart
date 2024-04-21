import 'package:get/get.dart';

import '../controllers/one_click_login_controller.dart';

class OneClickLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneClickLoginController>(
      () => OneClickLoginController(),
    );
  }
}
