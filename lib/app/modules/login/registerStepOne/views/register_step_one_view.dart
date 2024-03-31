import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../units/screenAdapter.dart';
import '../../../../widget/logo.dart';
import '../../../../widget/passButton.dart';
import '../../../../widget/passTextField.dart';
import '../controllers/register_step_one_controller.dart';

class RegisterStepOneView extends GetView<RegisterStepOneController> {
  const RegisterStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("手机号快速注册"),
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          //logo
          const Logo(),
          //输入手机号
          PassTextFiled(
              controller: controller.editingController,//这是获取电话
              hintText: "请输入手机号",
              onChanged: (value) {
                print(value);
              }),
          SizedBox(height: ScreenAdapter.height(40)),
          PassButton(
              text: "下一步",
              onPressed: () async {
                //判断手机号是否合法GetUtils.isPhoneNumber也可以用正则
                if (GetUtils.isPhoneNumber(controller.editingController.text) && controller.editingController.text.length==11) {
                  var flag = await controller.sendCode();
                  if (flag) {
                    Get.toNamed("/register-step-two",arguments: {
                      "tel":controller.editingController.text//把手机号传到下个页面以便验证
                    });
                  } else {
                    Get.snackbar("提示信息!", "网络异常");
                  }
                } else {
                  Get.snackbar("提示信息!", "手机号格式不合法");
                }
              }),

          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("遇到问题？您可以"),
                TextButton(
                    onPressed: () {
                      print("获取帮助");
                    },
                    child: const Text("获取帮助"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
