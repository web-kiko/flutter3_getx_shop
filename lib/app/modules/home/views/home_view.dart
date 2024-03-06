/*
 * @Descripttion: 
 * @version: 
 * @Author: kiko
 * @Date: 2024-02-21 10:54:07
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-06 02:51:42
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart'; //缓存状态
import '../../../services/screenAdapter.dart'; //适配
import '../../../services/myFonts.dart'; //引入字标库
import 'package:flutter_swiper_view/flutter_swiper_view.dart'; //轮播图
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; //瀑布流

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  //顶部导航
  Widget _appBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(() => AppBar(
            leading: controller.flag.value
                ? const Text("")
                : const Icon(
                    MyFonts.xiaomi,
                    color: Colors.red,
                  ),
            leadingWidth: controller.flag.value
                ? ScreenAdapter.width(40)
                : ScreenAdapter.width(140),
            title: AnimatedContainer(
              width: controller.flag.value
                  ? ScreenAdapter.width(800)
                  : ScreenAdapter.width(620),
              height: ScreenAdapter.height(96),
              decoration: BoxDecoration(
                color: const Color.fromARGB(230, 252, 243, 236),
                borderRadius: BorderRadius.circular(30),
              ),
              duration: const Duration(milliseconds: 600),
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
            centerTitle: true,
            backgroundColor:
                controller.flag.value ? Colors.white : Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code,
                    color:
                        controller.flag.value ? Colors.black87 : Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message,
                      color: controller.flag.value
                          ? Colors.black87
                          : Colors.white))
            ],
          )),
    );
  }

  //轮播图
  Widget _focus() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(() => Swiper(
            itemBuilder: (context, index) {
              String picUrl =
                  "https://miapp.itying.com/${controller.swiperList[index].pic}";
              return Image.network(
                picUrl.replaceAll("\\", "/"),
                fit: BoxFit.fill,
              );
            },
            itemCount: controller.swiperList.length,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            autoplay: true,
            loop: true,
            // duration:3000
          )),
    );
  }

  //banner
  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assets/images/xiaomiBanner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  //顶部滑动分类
  Widget _category() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(470),
      // color: Colors.red,
      child: Obx(() => Swiper(
            itemBuilder: (context, index) {
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: ScreenAdapter.width(20),
                    mainAxisSpacing: ScreenAdapter.height(20),
                  ),
                  itemBuilder: (context, i) {
                    String picUrl =
                        "https://xiaomi.itying.com/${controller.categoryList[index * 10 + i].pic}";
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ScreenAdapter.height(120),
                          height: ScreenAdapter.height(120),
                          child: Image.network(picUrl.replaceAll("\\", "/"),
                              fit: BoxFit.fitHeight),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text(
                              "${controller.categoryList[index * 10 + i].title}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34))),
                        )
                      ],
                    );
                  });
            },
            itemCount: controller.categoryList.length ~/ 10, //取整
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints.expand(height: ScreenAdapter.height(20)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              activeColor: Colors.black54,
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
          )),
    );
  }

  //banner
  Widget _banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
          ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
            color: Colors.red,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/xiaomiBanner2.png"))),
        height: ScreenAdapter.height(420),
      ),
    );
  }

//热销臻选
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenAdapter.width(30),
                ScreenAdapter.height(40),
                ScreenAdapter.width(30),
                ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("热销臻选",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(46))),
                Text("更多手机推荐 >",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
              ],
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,
              ScreenAdapter.width(20), ScreenAdapter.height(20)),
          child: Row(
            children: [
              //左侧
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(800),
                    child: Obx(() => Swiper(
                        itemBuilder: (context, index) {
                          String picUrl =
                              "https://miapp.itying.com/${controller.bestSellingSwiperList[index].pic}";
                          return Image.network(
                            picUrl.replaceAll("\\", "/"),
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: controller.bestSellingSwiperList.length,
                        autoplay: true,
                        loop: true,
                        pagination: SwiperPagination(
                            margin: const EdgeInsets.all(0.0),
                            builder: SwiperCustomPagination(builder:
                                (BuildContext context,
                                    SwiperPluginConfig config) {
                              return ConstrainedBox(
                                constraints: BoxConstraints.expand(
                                    height: ScreenAdapter.height(36)),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child:
                                            const RectSwiperPaginationBuilder(
                                          color: Colors.black12,
                                          activeColor: Colors.black54,
                                        ).build(context, config),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })))),
                  )),
              SizedBox(width: ScreenAdapter.width(20)),
              //右侧
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(800),
                    child: Obx(() => Column(
                            children: controller.sellingPlist
                                .asMap()
                                .entries
                                .map((entrie) {
                          var value = entrie.value;
                          var picUrl = "https://miapp.itying.com/${value.pic}";
                          return Expanded(
                              flex: 1,
                              child: Container(
                                color: const Color.fromRGBO(246, 246, 246, 1),
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    entrie.key == 2
                                        ? 0
                                        : ScreenAdapter.height(20)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: ScreenAdapter.height(25)),
                                          Text("${value.title}",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          28),
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                              height: ScreenAdapter.height(25)),
                                          Text("${value.subTitle}",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          28))),
                                          SizedBox(
                                              height: ScreenAdapter.height(25)),
                                          Text("￥${value.price}元",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          34)))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            ScreenAdapter.height(8)),
                                        child: Image.network(
                                            picUrl.replaceAll("\\", "/"),
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }).toList())),
                  )),
            ],
          ),
        )
      ],
    );
  }

//瀑佈流商品
   Widget _bestGoods() {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenAdapter.width(30),
                ScreenAdapter.height(40),
                ScreenAdapter.width(30),
                ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("省心优惠",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(46))),
                Text("全部优惠 >",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
              ],
            )),
        Obx(()=>Container(
          padding: EdgeInsets.all(ScreenAdapter.width(26)),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: ScreenAdapter.width(26),
            crossAxisSpacing: ScreenAdapter.width(26),
            itemCount: controller.bestPlist.length,   //注意
            shrinkWrap: true,//收缩，让元素宽度自适应            
            physics: const NeverScrollableScrollPhysics(), //禁止滑动
            itemBuilder: (context, index) {
              var picUrl="https://miapp.itying.com/${controller.bestPlist[index].sPic}";
              return Container(
                padding: EdgeInsets.all(ScreenAdapter.width(20)),
                decoration: BoxDecoration(                 
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),                     
                      child: Image.network(
                        picUrl.replaceAll("\\", "/"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      width: double.infinity,
                      child: Text(
                        "${controller.bestPlist[index].title}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(42),fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      width: double.infinity,
                      child: Text(
                        "${controller.bestPlist[index].subTitle}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      width: double.infinity,
                      child: Text(
                        "¥${controller.bestPlist[index].price}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(32),fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ))
      ],
    );
  }


  //内容区域
  Widget _homePage() {
    return Positioned(
        top: -40,
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(
          controller: controller.scrollController,
          children: [
            _focus(),
            _banner(),
            _category(),
            _banner2(),
            _bestSelling(),
            _bestGoods(),
            const SizedBox(
              height: 100,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
      body: Stack(
        children: [
          _homePage(),
          _appBar(),
        ],
      ),
    ));
  }
}
