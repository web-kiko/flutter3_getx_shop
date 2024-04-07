import 'package:get/get.dart';

import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../units/httpsClient.dart';
import '../../../units/signServices.dart';
import '../../../units/storage.dart';
import '../../../units/userServices.dart';

class CheckoutController extends GetxController {
  RxList checkoutList = [].obs;
   HttpsClient httpsClient = HttpsClient();
  RxList<AddressItemModel> addressList=<AddressItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getCheckoutData();
    getDefaultAddress();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //获取要结算的商品
  getCheckoutData() async {
    List tempList = await Storage.getData("checkoutList");
    checkoutList.value = tempList;
    update();
  }

  //默认收货地址
  getDefaultAddress() async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);

    Map tempJson = {"uid": userInfo.sId};    
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });
    var response =
        await httpsClient.get("api/oneAddressList?uid=${userInfo.sId}&sign=$sign");
     print(response);

    if(response!=null){
      var tempAddressList= AddressModel.fromJson(response.data);
      addressList.value=tempAddressList.result!;
      update();
    }
  }
}
