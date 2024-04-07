import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user_model.dart';
import '../../../../units/httpsClient.dart';
import '../../../../units/signServices.dart';
import '../../../../units/userServices.dart';
import '../../addressList/controllers/address_list_controller.dart';

class AddressEditController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxString area = "".obs;
  String addressId = Get.arguments["id"];
  HttpsClient httpsClient = HttpsClient();
 //返回的时候更新收货地址列表里面的数据
  AddressListController listController = Get.find<AddressListController>();

  @override
  void onInit() {
    initAddressData();
    super.onInit();
  }

//拿到收货地址传过来的值
  initAddressData() {
    nameController.text = Get.arguments["name"];
    phoneController.text = Get.arguments["phone"];
    //拆分字符串只要详细部分不要省市区
    String address = Get.arguments["address"];
    List addressList = address.split(" ");
    area.value = "${addressList[0]} ${addressList[1]} ${addressList[2]}";
    print(addressList);
    print("------------");
    addressList.removeRange(0, 3);
    addressController.text = Get.arguments["address"];
    print(addressList);
    addressController.text = addressList.join(" ");
  }

  @override
  void onClose() {
    //返回的时候更新收货地址列表里面的数据
    listController.getAddressList();
    super.onClose();
  }

  setArea(String str) {
    area.value = str;
    update();
  }

//保存修改后的收货地址
  doEditAddress() async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);

    if (nameController.text.length < 2) {
      Get.snackbar("提示信息", "请把姓名填写完整");
    } else if (!GetUtils.isPhoneNumber(phoneController.text) ||
        phoneController.text.length != 11) {
      Get.snackbar("提示信息", "手机号不合法");
    } else if (area.value.length < 2) {
      Get.snackbar("提示信息", "请选择地区");
    } else if (addressController.text.length < 2) {
      Get.snackbar("提示信息", "请填写详细的地址");
    } else {
      Map tempJson = {
        "id": addressId,
        "uid": userInfo.sId,
        "name": nameController.text,
        "phone": phoneController.text,
        "address": "${area.value} ${addressController.text}",
      };
      String sign = SignServices.getSign({
        ...tempJson, //合并对象
        "salt": userInfo.salt, //登录成功后服务器返回的salt  私钥
      });
      var response = await httpsClient
          .post("api/editAddress", data: {...tempJson, "sign": sign});
      if (response.data["success"]) {
        Get.back();
      } else {
        Get.snackbar("提示信息", response.data["message"]);
      }
    }
  }
}
