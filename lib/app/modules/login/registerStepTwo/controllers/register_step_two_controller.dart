import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../units/httpsClient.dart';

class RegisterStepTwoController extends GetxController {
  //TODO: Implement RegisterStepTwoController

  final TextEditingController editingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String tel = Get.arguments["tel"];
  RxInt seconds = 60.obs;
  @override
  void onInit() {
    super.onInit();
    countDown();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //验证验证码
  Future<bool> validateCode() async {
    var response = await httpsClient.post("api/validateCode", data: {
      "tel": tel, //上一个页面穿过来的手机号
      "code": editingController.text //验证码的值 
    });
    if (response != null) {
      if (response.data["success"]) {
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

   //重新发送验证码
  void sendCode() async {
    var response = await httpsClient.post("api/sendCode", data: {"tel": tel});
    if (response != null) {
      print(response);
      if (!response.data["success"]) {
        Get.snackbar("提示信息!", "非法请求");
      }else{

         //测试：把验证码复制到剪切板上面，正式上线不需要这句话,这个为了方便测试
         Clipboard.setData(ClipboardData(text: response.data["code"]));

        seconds.value=60;
        countDown();
        update();
      }
    } else {
      Get.snackbar("提示信息!", "网络异常请重试");
    }
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
}
