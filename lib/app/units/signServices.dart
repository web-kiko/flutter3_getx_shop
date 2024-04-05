import 'dart:convert';

import 'package:crypto/crypto.dart';
class SignServices {
    // 1.获取登录成功后服务器传回来的salt
    // 2.获取请求的所有参数
    // 3.生成一个map类型的对象
    // 4.获取map类型对象所有的key按照 ASCII 字符顺序进行升序排列
    // 5.在把数据进行拼接后在用MD5加密生成签名

    
   static String getSign(Map json) {  
    List jsonKeys=json.keys.toList();

    jsonKeys.sort();

     String str='';
     for (var i = 0; i < jsonKeys.length; i++) {
       str+="${jsonKeys[i]}${json[jsonKeys[i]]}";
     }    
     var sign=md5.convert(utf8.encode(str));
     return "$sign";
  }
}
