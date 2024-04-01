import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../models/message.dart';
import '../../../../units/httpsClient.dart';

class CodeLoginStepOneController extends GetxController {
  //TODO: Implement CodeLoginStepOneController

  TextEditingController telController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();

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

 //发送验证码
  Future<MessageModel> sendCode() async {
    var response = await httpsClient
        .post("api/sendLoginCode", data: {"tel": telController.text});
    if (response != null) {
      print(response);
      if (response.data["success"]) {
        //方便测试 正式上线需要删掉Clipboard代码
        Clipboard.setData(ClipboardData(text: response.data["code"]));

        return MessageModel(message: "发送验证码成功", success: true);
      }
      return MessageModel(message: response.data["message"], success: false);
    } else {
      return MessageModel(message: "网络异常", success: false);
    }
  }
}

