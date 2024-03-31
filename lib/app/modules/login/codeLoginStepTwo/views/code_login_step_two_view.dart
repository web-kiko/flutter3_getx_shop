import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../units/screenAdapter.dart';
import '../../../../widget/logo.dart';
import '../../../../widget/passButton.dart';
// import '../../../../widget/pinInput.dart';
import '../controllers/code_login_step_two_controller.dart';

class CodeLoginStepTwoView extends GetView<CodeLoginStepTwoController> {
  const CodeLoginStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,        
         title: const Text('手机号快速登录'),
         centerTitle: true,
      ),
     
/**
 * 自定义的六格验证码(粘贴验证码试了几次没成功太麻烦了直接换成第三方的pin_code_fields)
 * 
 *  body: ListView(
        children: [
           const Logo(),
           Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(60)),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    PinInput(controller:controller.fieldOne, autoFocus:true,isFirst: true,),
                    PinInput(controller:controller.fieldTwo, autoFocus:false),
                    PinInput(controller:controller.fieldThree, autoFocus:false),
                    PinInput(controller:controller.fieldFour, autoFocus:false),
                    PinInput(controller:controller.fieldFive, autoFocus:false),
                    PinInput(controller:controller.fieldSix, autoFocus:false),
                   
              ],
            ) ,
           ),

          PassButton(text: "获取验证码", onPressed: (){
             var text = controller.fieldOne.text +
                      controller.fieldTwo.text +
                      controller.fieldThree.text +
                       controller.fieldFour.text +
                        controller.fieldFive.text +
                      controller.fieldSix.text;

                print(text);
          })
        ],
       ),
     );
   }
 }

 * 
 */

      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
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
              onCompleted: (v) {
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
                TextButton(onPressed: () {}, child: const Text("重新发送验证码")),
                TextButton(onPressed: () {}, child: const Text("帮助")),
              ],
            ),
          ),
          PassButton(
              text: "获取验证码",
              onPressed: () {
                print(controller.editingController.text);
                // 隐藏键盘
                FocusScope.of(context).requestFocus(FocusNode());
              })
        ],
      ),
    );
  }
}
