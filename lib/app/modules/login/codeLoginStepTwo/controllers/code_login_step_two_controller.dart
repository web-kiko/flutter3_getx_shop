import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../models/message.dart';
import '../../../../units/httpsClient.dart';
import '../../../../units/storage.dart';
class CodeLoginStepTwoController extends GetxController {
  //TODO: Implement CodeLoginStepTwoController

   /*
   final TextEditingController fieldOne = TextEditingController();
   final TextEditingController fieldTwo = TextEditingController();
   final TextEditingController fieldThree = TextEditingController();
   final TextEditingController fieldFour = TextEditingController();
   final TextEditingController fieldFive = TextEditingController();
   final TextEditingController fieldSix = TextEditingController();

    */
  final TextEditingController editingController = TextEditingController();

  HttpsClient httpsClient = HttpsClient();
  String tel=Get.arguments["tel"];
  RxInt seconds = 10.obs;
  @override
  void onInit() {
    super.onInit();
  } 
  @override
  void onClose() {
    super.onClose();
  }
 //倒计时的方法
  countDown() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;
      if (seconds.value == 0) {
        timer.cancel();
      }
      update();
    });
  }

  
  //发送验证码
  Future<MessageModel> sendCode() async {
    var response = await httpsClient
        .post("api/sendLoginCode", data: {"tel": tel});
    if (response != null) {
      print(response);
      if (response.data["success"]) {
        //方便测试 粘贴验证码正式上线看需求
        Clipboard.setData(ClipboardData(text: response.data["code"]));
        seconds.value=10;
        countDown();
        return MessageModel(message: "发送验证码成功", success: true);
      }
      return MessageModel(message: response.data["message"], success: false);
    } else {
      return MessageModel(message: "网络异常", success: false);
    }
  }
  
  //执行登录
  Future<MessageModel> doLogin() async{      
      var response = await httpsClient.post("api/validateLoginCode",data:{
        "tel":tel,
        "code":editingController.text
      });

      if (response != null) {         
         print(response);
         if(response.data["success"]){
           //执行登录 保存用户信息
          Storage.setData("userinfo",response.data["userinfo"]);
        
          return MessageModel(message: "登录成功", success: true);
         }
        return MessageModel(message: response.data["message"], success: false);
      }else{
        return MessageModel(message:"网络异常", success: false);
      }
  }
}
