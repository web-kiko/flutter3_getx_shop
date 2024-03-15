/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-15 19:32:07
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-16 01:36:06
 * @FilePath: \flutter3_getx_shop\lib\app\modules\serach\views\serach_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/serach_controller.dart';
import '../../../units/screenAdapter.dart';

class SerachView extends GetView<SerachController> {
  const SerachView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Container(
          width: ScreenAdapter.width(900),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                child: const Icon(Icons.search),
              ),
              Text("手机",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(32)))
            ],
          ),
        ),
        onTap: (){
          Get.toNamed('/serach');
        },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [Text("")],
      ),
      body: const Center(
        child: Text(
          'SerachView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
