import 'package:get/get.dart';

import '../controllers/product_content_controller.dart';

class ProductContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductContentController>(
      () => ProductContentController(),
    );
  }
}
