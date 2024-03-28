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

   //增加数量
  void incCartNum(cartItem){
      var tempList=[];
      for (var i = 0; i < cartList.length; i++) {
          if(cartList[i]["_id"]==cartItem["_id"]&&cartList[i]["selectedAttr"]==cartItem["selectedAttr"]){
              cartList[i]["count"]++;
          }
          tempList.add(cartList[i]);
      }
      cartList.value=tempList;
      CartServices.setCartList(tempList);
      update();
  }
  // 减少数量
  void decCartNum(cartItem){
     var tempList=[];
      for (var i = 0; i < cartList.length; i++) {
          if(cartList[i]["_id"]==cartItem["_id"]&&cartList[i]["selectedAttr"]==cartItem["selectedAttr"]){
              if(cartList[i]["count"]>1){
                cartList[i]["count"]--;
              }else{
                Get.snackbar('提示！', "购物车数量已经到最小了");
              }
          }
          tempList.add(cartList[i]);
      }
      cartList.value=tempList;
      CartServices.setCartList(tempList);
      update();
  }
}
