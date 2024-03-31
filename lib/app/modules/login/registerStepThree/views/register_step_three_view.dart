import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              isPassWord: true,
              hintText: "请输入密码",
              keyboardType:TextInputType.text,
              onChanged: (value) {
                print(value);
              }),

          PassTextFiled(
              isPassWord: true,
              keyboardType:TextInputType.text,
              hintText: "请输入确认密码",
              onChanged: (value) {
                print(value);
              }),
                
          SizedBox(height: ScreenAdapter.height(20)),
          PassButton(
              text: "完成注册",
              onPressed: () {
                print("完成注册");
              
              }),         
        ],
      ),
    );
  }
}

