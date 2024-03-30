import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../units/screenAdapter.dart';
import '../../../../widget/logo.dart';
import '../../../../widget/passButton.dart';
import '../../../../widget/pinInput.dart';
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
      body: ListView(
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
