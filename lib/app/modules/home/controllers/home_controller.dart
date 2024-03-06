/*
 * @Descripttion: 
 * @version: 
 * @Author: kiko
 * @Date: 2024-02-21 10:54:07
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-06 16:32:40
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:dio/dio.dart';
import '../../../models/focus_model.dart';
import '../../../models/category_model.dart';
import '../../../models/plist_model.dart';
import '../../../services/httpsClient.dart';

class HomeController extends GetxController {
  //浮动导航开关
  RxBool flag = false.obs;
  //监听滑动
  final ScrollController scrollController = ScrollController();
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs; //注意需要定义成响应式数据
  RxList<FocusItemModel> bestSellingSwiperList = <FocusItemModel>[].obs;
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxList<PlistItemModel> sellingPlist = <PlistItemModel>[].obs;
   RxList<PlistItemModel> bestPlist = <PlistItemModel>[].obs;
   // ignore: unnecessary_new
   HttpsClient httpsClient =new HttpsClient();
  @override
  void onInit() {
    super.onInit();
    //滑动监听
    scrollControllerListener();
    //请求接口
    getFocusData();
    //获取分类数据
    getCategoryData();
    //获取热销臻选里面的轮播图
    getSellingSwiperData();
    //获取热销臻选里面的商品
    getSellingPlistData();
    // 获取热门商品
    getBestPlistData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //监听滚动条滚动事件
  void scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          //print("position.pixels > 10");
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          //print("position.pixels < 10");
          flag.value = false;
          update();
        }
      }
    });
  }

  //获取轮播图数据
  getFocusData() async {
    var response = await httpsClient.get("api/focus");
    if (response != null) {
      var focus = FocusModel.fromJson(response.data);
      swiperList.value = focus.result!;
      update();
    }
  }

 //获取热销臻选里面的轮播图
  getSellingSwiperData() async {
    var response = await httpsClient.get("api/focus?position=2");
    if (response != null) {
      var sellingSwiper = FocusModel.fromJson(response.data);
      bestSellingSwiperList.value = sellingSwiper.result!;
      update();
    }
  }

//获取热销臻选里面的商品数据
  getSellingPlistData() async {
    var response = await httpsClient.get("api/plist?is_hot=1&pageSize=3");
    if (response != null) {
      var plist = PlistModel.fromJson(response.data);
      sellingPlist.value = plist.result!;
      update();
    }
  }

  //获取分类数据
  getCategoryData() async {
    var response = await httpsClient.get("api/bestCate");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      categoryList.value = category.result!;
      update();
    }
  }

  //获取热门商品数据
  getBestPlistData() async {
    var response = await httpsClient.get("api/plist?is_best=1");
    if (response != null) {
      var plist = PlistModel.fromJson(response.data);
      bestPlist.value = plist.result!;
      update();
    }
  }
}
