import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../models/message.dart';
import '../../../../units/screenAdapter.dart';
import '../../../../widget/logo.dart';
import '../../../../widget/passButton.dart';
import '../../../../widget/passTextField.dart';
import '../controllers/register_step_three_controller.dart';

class RegisterStepThreeView extends GetView<RegisterStepThreeController> {
  const RegisterStepThreeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("手机号快速注册"),
        actions: [TextButton(onPressed: () {}, child: const Text("帮助"))],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
          //输入手机号
          PassTextFiled(
            controller: controller.passController,
              isPassWord: true,
              hintText: "请输入密码",
              keyboardType:TextInputType.text,
              onChanged: (value) {
                print(value);
              }),

          PassTextFiled(
            controller: controller.confirmPassController,
              isPassWord: true,
              keyboardType:TextInputType.text,
              hintText: "请输入确认密码",
              onChanged: (value) {
                print(value);
              }),
                
          SizedBox(height: ScreenAdapter.height(20)),
          PassButton(
              text: "完成注册",
              onPressed: () async{
                if(controller.passController.text!=controller.confirmPassController.text){
                  Get.snackbar("提示信息！","密码和确认密码不一致");
                }else if(controller.passController.text.length<6){
                   Get.snackbar("提示信息！","密码长度不能小于6位");
                }else{
                  //model类你也可以用map表示返回的各种多个信息
                    MessageModel result= await controller.doRegister();
                    if(result.success){
                      //执行跳转  回到根
                      Get.offAllNamed("/tabs",arguments: {
                        "initialPage":4   //注册完成后会加载tabs第五个页面
                      });
                    }else{
                      Get.snackbar("提示信息！",result.message);
                    }
                }
              
              }),         
        ],
      ),
    );
  }
}
