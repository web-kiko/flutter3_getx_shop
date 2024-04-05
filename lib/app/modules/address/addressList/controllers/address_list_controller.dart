import 'package:get/get.dart';

import '../../../../models/address_model.dart';
import '../../../../models/user_model.dart';
import '../../../../units/httpsClient.dart';
import '../../../../units/signServices.dart';
import '../../../../units/userServices.dart';

class AddressListController extends GetxController {
 HttpsClient httpsClient = HttpsClient();
  RxList<AddressItemModel> addressList=<AddressItemModel>[].obs;
  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

  @override
  void onClose() {
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
}
