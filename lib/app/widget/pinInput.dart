import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../units/screenAdapter.dart';

class PinInput extends StatelessWidget {
   final bool isFirst;
   final TextEditingController controller;
   final bool autoFocus;
   const PinInput( {Key? key,required this.controller, required this.autoFocus,this.isFirst=false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: ScreenAdapter.height(180),
      width:  ScreenAdapter.height(120),
      child: TextField(        
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,//默认调取数字键盘
        controller: controller,//调取TextField里的值
        maxLength: 1,        
         cursorColor: Theme.of(context).primaryColor,
        decoration:  InputDecoration(//边框
            border: const OutlineInputBorder(),
            counterText: '',  //位于右下方显示的文本，常用于显示输入的字符数量
            hintStyle: TextStyle(color: Colors.black, fontSize: ScreenAdapter.fontSize(40))),
           onChanged: (value) {
              print(value);
              print(Clipboard.getData(Clipboard.kTextPlain));
              if (value.isNotEmpty) {

              //自动跳转到下一个焦点
                FocusScope.of(context).nextFocus();
              }      
              if (value.isEmpty&&!isFirst) {
                //自动跳转到上一个焦点
                FocusScope.of(context).previousFocus();
              }            
           },
        
      ),
    );
  }
}