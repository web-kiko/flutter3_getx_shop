import 'package:get/get.dart';

class BuyController extends GetxController {
  RxList buyList = [
    {
      "id": 1,
      "title": "支付宝支付",
      "chekced": true,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 2,
      "title": "微信支付",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ].obs;

  int buyType = 0;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
   //改变支付方式
   changeBuyList(index) {
    List<Map<String, Object>> tempList = [];
    for (var i = 0; i < buyList.length; i++) {
      buyList[i]["chekced"] = false;
      tempList.add(buyList[i]);
    }    
    tempList[index]["chekced"] = true;
  buyType=index;
    buyList.value = tempList;
    update();
  }
}
