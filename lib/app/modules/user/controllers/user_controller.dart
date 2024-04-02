import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../units/userServices.dart';

class UserController extends GetxController {
  RxBool isLogin = false.obs;
  // RxList userList = [].obs;
  var userInfo = UserModel().obs;//把用户信息模块化
  @override
  void onInit() {
    super.onInit();
    print("userinfo");
    getUserInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //获取用户信息
  getUserInfo() async {
    var tempLoginState = await UserServices.getUserLoginState();
    isLogin.value = tempLoginState;
    var tempList = await UserServices.getUserInfo();
    if (tempList.isNotEmpty) {
      userInfo.value = UserModel.fromJson(tempList[0]);
      update();
    }
  }

//退出登录
  loginOut() {
    UserServices.loginOut();
    isLogin.value = false;
    //把信息值为空
    userInfo.value = UserModel();
    update();
  }
}
