import 'package:get/get.dart';

import '../../../units/cartServices.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  RxList cartList=[].obs;
  @override
  void onInit() {
    super.onInit();
    // CartServices.clearCartData();
   print("cart init");

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
//获取购物车里的数据
   void getCartListData()async {
    var tempList =await CartServices.getCartList();
    cartList.value=tempList;
    update();
  }
}
