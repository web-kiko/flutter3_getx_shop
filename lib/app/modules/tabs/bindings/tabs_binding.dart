/*
 * @Descripttion: 
 * @version: 
 * @Author: kiko
 * @Date: 2024-02-21 11:07:38
 * @LastEditors: kiko
 * @LastEditTime: 2024-02-21 12:12:41
 */
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../category/controllers/category_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../service/controllers/service_controller.dart';
import '../../user/controllers/user_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
