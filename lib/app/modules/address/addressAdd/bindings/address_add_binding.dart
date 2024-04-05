import 'package:get/get.dart';

import '../controllers/address_add_controller.dart';

class AddressAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressAddController>(
      () => AddressAddController(),
    );
  }
}
