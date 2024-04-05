import 'package:get/get.dart';

import '../controllers/address_list_controller.dart';

class AddressListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressListController>(
      () => AddressListController(),
    );
  }
}
