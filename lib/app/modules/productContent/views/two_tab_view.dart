/*
 * @ Author: kiko
 * @ Create Time: 2024-03-24 00:43:39
 * @ Modified by: kiko
 * @ Modified time: 2024-03-24 01:21:34
 * @ Description:
 */

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../units/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class TwoTabView extends GetView {
  @override
   final ProductContentController controller = Get.find();
   
  TwoTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      alignment: Alignment.center,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(2200),
      color: Colors.green,
      child: const Text("详情", style: TextStyle(fontSize: 100)),
    );
  }
}
