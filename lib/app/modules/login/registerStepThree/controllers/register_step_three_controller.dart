import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/message.dart';
import '../../../../units/httpsClient.dart';
import '../../../../units/storage.dart';

class RegisterStepThreeController extends GetxController {
  //TODO: Implement RegisterStepThreeController

  TextEditingController passController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  HttpsClient httpsClient = HttpsClient();  
  String tel=Get.arguments["tel"];
  String code=Get.arguments["code"];
  
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

  //执行注册
 Future<MessageModel> doRegister() async{
     var response = await httpsClient.post("api/register",data:{
        "tel":tel,
        "password":passController.text,
        "code":code
      });
      if (response != null) {
         print(response);
         if(response.data["success"]){        
          //执行登录 保存用户信息
           Storage.setData("userinfo",response.data["userinfo"]);
           return MessageModel(message: "注册成功", success: true);
         }
        
          return MessageModel(message: response.data["message"], success: false);
      }else{
          return MessageModel(message: "网络异常", success: false);
      }
  }
}
