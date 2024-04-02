import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/message.dart';
import '../../../../units/httpsClient.dart';
import '../../../../units/storage.dart';
import '../../../user/controllers/user_controller.dart';
class PassLoginController extends GetxController {
  //TODO: Implement PassLoginController

  TextEditingController telController=TextEditingController();
 TextEditingController passController=TextEditingController();
  HttpsClient httpsClient = HttpsClient(); 
  UserController userController =Get.find<UserController>(); 
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
    //更新用户状态
    print("更新用户状态");
    userController.getUserInfo();
    super.onClose();
  }

 Future<MessageModel> doLogin() async{
    var response = await httpsClient.post("api/doLogin",data:{
        "username":telController.text,
        "password":passController.text,
      });
      if (response != null) {
         print(response);
         if(response.data["success"]){
          //保存用户信息
           Storage.setData("userinfo",response.data["userinfo"]);         
          return MessageModel(message: "登录成功", success: true);
         }
        return MessageModel(message: response.data["message"], success: false);
      }else{
        return MessageModel(message:"网络异常", success: false);
      }
  }

}
