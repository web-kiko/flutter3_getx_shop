/*
 * @Descripttion: 
 * @version: 
 * @Author: kiko
 * @Date: 2024-02-21 11:07:38
 * @LastEditors: kiko
 * @LastEditTime: 2024-02-22 15:11:39
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(//左右滑动切换页面
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
          ), //
          bottomNavigationBar: BottomNavigationBar(
              fixedColor: Colors.red, //选中的颜色
              currentIndex: controller.currentIndex.value, //第几个菜单选中
              type:
                  BottomNavigationBarType.fixed, //如果底部有4个或者4个以上的菜单的时候就需要配置这个参数
              onTap: (index) {
                controller.setCurrentIndex(index);
                controller.pageController.jumpToPage(index);//pageVIew转换页面
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "分类"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.room_service), label: "服务"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: "购物车"),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
              ]),
        ));
  }
}
