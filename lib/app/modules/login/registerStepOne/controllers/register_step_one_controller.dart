
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../units/httpsClient.dart';

class RegisterStepOneController extends GetxController {
  //TODO: Implement RegisterStepOneController

  TextEditingController editingController=TextEditingController();
  HttpsClient httpsClient = HttpsClient();  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  //发送验证码
  Future<bool> sendCode() async{
      var response = await httpsClient.post("api/sendCode",data:{
        "tel":editingController.text
      });
      if (response != null) {
         print(response);
         if(response.data["success"]){
          //测试：把验证码复制到剪切板上面，正式上线不需要这句话,这个为了方便测试
          Clipboard.setData(ClipboardData(text: response.data["code"]));
          return true;
         }
         return false;
      }else{
        return false;
      }
  }
}
