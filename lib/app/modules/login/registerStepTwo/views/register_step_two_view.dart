/*
 * @ Author: kiko
 * @ Create Time: 2024-03-29 22:35:34
 * @ Modified by: kiko
 * @ Modified time: 2024-03-31 23:11:13
 * @ Description:
 */


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../units/screenAdapter.dart';
import '../../../../widget/logo.dart';
import '../../../../widget/passButton.dart';
import '../controllers/register_step_two_controller.dart';


class RegisterStepTwoView extends GetView<RegisterStepTwoController> {
  const RegisterStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('手机号快速注册'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text("请输入验证码",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenAdapter.height(20)),
                Text("已发送至 ${controller.tel}")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(60)),
            padding: EdgeInsets.all(ScreenAdapter.width(40)),
            child: PinCodeTextField(
              autoFocus: true, //进入就弹出键盘
              keyboardType: TextInputType.number, //调用数字键盘
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              dialogConfig: DialogConfig(
                  //汉化dialog
                  dialogTitle: "黏贴验证码",
                  dialogContent: "确定要黏贴验证码",
                  affirmativeText: "确定",
                  negativeText: "取消"), //配置dialog
              pinTheme: PinTheme(
                //样式
                // 修改边框
                activeColor: Colors.black12, // 输入文字后边框的颜色
                selectedColor: Colors.orange, // 选中边框的颜色
                inactiveColor: Colors.black12, //默认的边框颜色
                //背景颜色
                activeFillColor: Colors.white,
                selectedFillColor: Colors.orange,
                inactiveFillColor: const Color.fromRGBO(245, 245, 245, 1),

                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: controller.editingController, //TextFiled控制器
              onCompleted: (v) async{
                var flag = await controller.validateCode();
                if (flag) {
                   Get.toNamed("/register-step-three",arguments: {
                    "tel":controller.tel,
                    "code":controller.editingController.text
                  });
                } else {
                  Get.snackbar("提示信息!", "验证码输入错误");
                }
                print("Completed");
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
              appContext: context, //注意需要传入context
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //倒计时
                Obx(() => controller.seconds.value > 0
                    ? TextButton(onPressed: null, child: Text("${controller.seconds.value}秒后重新发送"))
                    : TextButton(onPressed: () {
                        controller.sendCode();
                    }, child: const Text("重新发送验证码"))),
                TextButton(onPressed: () {}, child: const Text("帮助")),
              ],
            ),
          ),
          PassButton(
              text: "下一步",
              onPressed: () async {
                // 隐藏键盘
                FocusScope.of(context).requestFocus(FocusNode());
                //验证验证码要加上await 因为他是异步
                var flag = await controller.validateCode();
                if (flag) {
                   Get.toNamed("/register-step-three",arguments: {
                    "tel":controller.tel,
                    "code":controller.editingController.text
                  });
                } else {
                  Get.snackbar("提示信息!", "验证码输入错误");
                }
              })
        ],
      ),
    );
  }
}

