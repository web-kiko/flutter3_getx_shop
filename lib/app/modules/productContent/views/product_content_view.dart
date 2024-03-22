import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_content_controller.dart';
import '../../../units/screenAdapter.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //实现透明导航
      appBar: PreferredSize(//圆形
          preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
          child: Obx(
            () => AppBar(
              leading: Container(
                alignment: Alignment.center,
                child: SizedBox(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          //注意:去掉button默认的padding
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black12),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    )),
              ),
              title: SizedBox(
                width: ScreenAdapter.width(400),
                height: ScreenAdapter.height(96),
                child: controller.showTabs.value
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.tabsList.map((v) {
                          return InkWell(
                              onTap: () {
                                controller.changeSelectedTabsIndex(v["id"]);
                                //跳转到指定的容器
                                if (v["id"] == 1) {
                                  Scrollable.ensureVisible(//结合下面的SingleChildScrollView实现锚点跳转
                                      controller.gk1.currentContext
                                          as BuildContext,
                                     
                                      duration: //动画效果
                                          const Duration(milliseconds: 100));
                                } else if (v["id"] == 2) {
                                  Scrollable.ensureVisible(
                                      controller.gk2.currentContext
                                          as BuildContext,
                                      duration:
                                          const Duration(milliseconds: 100));
                                } else {
                                  Scrollable.ensureVisible(
                                      controller.gk3.currentContext
                                          as BuildContext,
                                      duration:
                                          const Duration(milliseconds: 500));
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${v["title"]}",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(36)),
                                  ),
                                  v["id"] == controller.selectedTabsIndex.value
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              top: ScreenAdapter.height(10)),
                                          width: ScreenAdapter.width(100),
                                          height: ScreenAdapter.height(2),
                                          color: Colors.red,
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(
                                              top: ScreenAdapter.height(10)),
                                          width: ScreenAdapter.width(100),
                                          height: ScreenAdapter.height(2),
                                        )
                                ],
                              ));
                        }).toList())
                    : const Text(""),
              ),
              centerTitle: true,
              backgroundColor:
                  Colors.white.withOpacity(controller.opcity.value), //实现透明导航
              elevation: 0, //实现透明导航
              actions: [
                Container(
                  margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                  width: ScreenAdapter.width(88),
                  height: ScreenAdapter.width(88),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          //注意:去掉button默认的padding
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black12),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: const Icon(
                        Icons.file_upload_outlined,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                  width: ScreenAdapter.width(88),
                  height: ScreenAdapter.width(88),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          //注意
                          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black12),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      child: const Icon(
                        Icons.more_horiz_rounded,
                      )),
                ),
              ],
            ),
          )),
      //singlechildScerollView锚点 controller.gk1.currentContext as BuildContext实现tab跳转   
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            Container(
              key: controller.gk1,
              alignment: Alignment.center,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(1800),
              color: Colors.orange,
              child: const Text("商品", style: TextStyle(fontSize: 100)),
            ),
            Container(
              key: controller.gk2,
              alignment: Alignment.center,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(2900),
              color: Colors.blue,
              child: const Text("详情", style: TextStyle(fontSize: 100)),
            ),
            Container(
              key: controller.gk3,
              alignment: Alignment.center,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(2200),
              color: Colors.red,
              child: const Text("推荐", style: TextStyle(fontSize: 100)),
            ),
          ],
        ),
      ),
    );
  }
}