import 'package:get/get.dart';

import '../../../../models/address_model.dart';
import '../../../../models/user_model.dart';
import '../../../../units/httpsClient.dart';
import '../../../../units/signServices.dart';
import '../../../../units/userServices.dart';
import '../../../checkout/controllers/checkout_controller.dart';

class AddressListController extends GetxController {
 HttpsClient httpsClient = HttpsClient();
  RxList<AddressItemModel> addressList=<AddressItemModel>[].obs;
  
  CheckoutController checkoutController=Get.find<CheckoutController>();
  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

  @override
  void onClose() {
    checkoutController.getDefaultAddress();
    super.onClose();
  }

  getAddressList() async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);
    Map tempJson = {"uid": userInfo.sId};
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });
    var response =
        await httpsClient.get("api/addressList?uid=${userInfo.sId}&sign=$sign");
    if(response!=null){
      var tempAddressList= AddressModel.fromJson(response.data);
      addressList.value=tempAddressList.result!;
      update();
    }
  }
//改变默认地址
    changeDefaultAddress(id) async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);
    Map tempJson = {"uid": userInfo.sId,"id":id};
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });
    var response =
        await httpsClient.post("api/changeDefaultAddress",data: {
            ...tempJson,
            "sign":sign
        });
    if(response!=null){
      Get.back();
    }
  }
   //删除收货地址
  deleteAddress(id) async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);
    Map tempJson = {"uid": userInfo.sId,"id":id};
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });
    var response =
        await httpsClient.post("api/deleteAddress",data: {
            ...tempJson,
            "sign":sign
        });
    if(response!=null){
      //删除成功重新更新当前页面的数据
      getAddressList();
    }
  }
}
