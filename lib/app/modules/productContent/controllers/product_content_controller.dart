/*
 * @ Author: kiko
 * @ Create Time: 2024-03-21 02:39:33
 * @ Modified by: kiko
 * @ Modified time: 2024-03-25 01:58:33
 * @ Description:
 */

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/pcontent_model.dart';
import '../../../units/httpsClient.dart';

class ProductContentController extends GetxController {
  final ScrollController scrollController = ScrollController();

  HttpsClient httpsClient = HttpsClient();
  //导航的透明度
  RxDouble opcity = 0.0.obs;
  //是否显示tabs
  RxBool showTabs = false.obs;
  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];
  RxInt selectedTabsIndex = 1.obs;
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  
  //详情数据
  var pcontent=PcontentItemModel().obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getContentData();
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
        if (showTabs.value == true) {
          showTabs.value = false;
        }
        update();
      } else {
        if (showTabs.value == false) {
          showTabs.value = true;
          update();
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
//改变tab切换
  void changeSelectedTabsIndex(index) {
    selectedTabsIndex.value = index;
    update();
  }

   //获取详情数据
  getContentData() async {
    var response = await httpsClient.get("api/pcontent?id=${Get.arguments["id"]}");
    if (response != null) {
      var tempData = PcontentModel.fromJson(response.data);     
      pcontent.value=tempData.result!;
      update();
    }
  }
}
