import 'package:get/get.dart';

import '../../../units/userServices.dart';

class UserController extends GetxController {
   RxBool isLogin=false.obs;
  RxList userList=[].obs;
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }


  @override
  void onClose() {
    super.onClose();
  }
  
  //获取用户信息
  getUserInfo() async{
    var tempLoginState=await UserServices.getUserLoginState();
    isLogin.value=tempLoginState;
    var tempList=await UserServices.getUserInfo();
    if(tempList.isNotEmpty){
      userList.value=tempList;
    }
  }

  loginOut(){
    UserServices.loginOut();
     isLogin.value=false;
     userList.value=[];
     update();
  }

}
