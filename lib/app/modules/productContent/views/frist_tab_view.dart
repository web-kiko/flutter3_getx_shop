

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../units/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class FristTabView extends GetView {
   @override
    final ProductContentController controller = Get.find();
   FristTabView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      alignment: Alignment.center,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(2200),
      color: Colors.red,
      child: const Text("商品", style: TextStyle(fontSize: 100)),
    );
  }
}

 
