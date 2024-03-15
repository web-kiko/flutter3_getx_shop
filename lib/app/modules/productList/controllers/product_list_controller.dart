/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-07 16:52:11
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-15 15:18:49
 * @FilePath: \flutter3_getx_shop\lib\app\modules\productList\controllers\product_list_controller.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:get/get.dart';
import '../../../models/plist_model.dart';
import '../../../units/httpsClient.dart';
import 'package:flutter/material.dart';

class ProductListController extends GetxController {
  RxList<PlistItemModel> plist = <PlistItemModel>[].obs;
  HttpsClient httpsClient = HttpsClient();
  int page = 1;
  int pageSize = 8;
  ScrollController scrollController = ScrollController();//滚动条触发数据
   bool flag = true;//避免重复请求
  RxBool hasData = true.obs;//没了数据就不请求了
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();//侧边栏

  /*二级导航数据*/
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":-1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];
  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;
  
  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
    getPlistData();
    initScrollController();
  }

  @override
  void onReady() {
    super.onReady();
  }

//监听滚动条事件
  void initScrollController() {
    scrollController.addListener(() {
      // scrollController.position.pixels  滚动条下拉的高度
      // scrollController.position.maxScrollExtent  //页面的高度
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent - 20)) {
        getPlistData();
      }
    });
  }

    //二级导航改变的时候触发的方法
  void subHeaderChange(id) {
    if (id == 4) {
      selectHeaderId.value = id;
      scaffoldGlobalKey.currentState!.openEndDrawer();
      //弹出侧边栏
    } else {
      selectHeaderId.value = id;

      
    }
  }
  @override
  void onClose() {
    super.onClose();
  }

  void getPlistData() async {
    if (flag && hasData.value) {
      flag=false;
      print(
          "api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=$pageSize");
      var response = await httpsClient.get(
          "api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=$pageSize");
      if (response != null) {
        var plistTemp = PlistModel.fromJson(response.data);
        //注意:拼接数据
        plist.addAll(plistTemp.result!);
        page++;
        update();
        flag=true;
        if(plistTemp.result!.length<pageSize){
          hasData.value=false;
        }
      }
    }
  }
}
