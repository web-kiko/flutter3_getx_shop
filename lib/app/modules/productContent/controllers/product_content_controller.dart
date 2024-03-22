import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductContentController extends GetxController {

  final ScrollController scrollController = ScrollController();
  RxDouble opcity = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

//监听滚动条滚动事件
  void scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 100) {
        opcity.value = scrollController.position.pixels / 100;
        print(opcity.value);
        update();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
