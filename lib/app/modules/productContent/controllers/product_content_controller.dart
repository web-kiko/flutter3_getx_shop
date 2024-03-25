/*
 * @ Author: kiko
 * @ Create Time: 2024-03-21 02:39:33
 * @ Modified by: kiko
 * @ Modified time: 2024-03-26 05:23:09
 * @ Description:
 */

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/pcontent_model.dart';
import '../../../units/httpsClient.dart';
import '../../../units/screenAdapter.dart';

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
  var pcontent = PcontentItemModel().obs;

  //attr属性筛选
  RxList<PcontentAttrModel> pcontentAttr = <PcontentAttrModel>[].obs;

  //详情 container的位置
  double gk2Position = 0;
  double gk3Position = 0;
  //是否显示详情tab切换
  RxBool showSubHeaderTabs = false.obs;

  List subTabsList = [
    {
      "id": 1,
      "title": "商品介绍",
    },
    {"id": 2, "title": "规格参数"},
  ];
  RxInt selectedSubTabsIndex = 1.obs;

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

//获取元素位置   globalKey.currentContext!.findRenderObject()可以获取渲染的属性。
  getContainerPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2Position = box2.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3Position = box3.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));
    print(gk2Position);

    print(gk3Position);
  }

  //监听滚动条滚动事件
  void scrollControllerListener() {
    scrollController.addListener(() {
      //获取渲染后的元素的位置
      if(gk2Position==0&& gk3Position==0){
        print(scrollController.position.pixels);  
        //获取Container高度的时候获取的是距离顶部的高度，如果要从0开始计算要加下滚动条下拉的高度
        getContainerPosition(scrollController.position.pixels);
      }
      //显示隐藏详情 subHeader tab切换
      if(scrollController.position.pixels>gk2Position&& scrollController.position.pixels<gk3Position){
          if(showSubHeaderTabs.value==false){
            showSubHeaderTabs.value=true;
            selectedTabsIndex.value=2;
            update();
          }
      }else if(scrollController.position.pixels>0&& scrollController.position.pixels<gk2Position){
          if( showSubHeaderTabs.value==true){
            showSubHeaderTabs.value=false;
             selectedTabsIndex.value=1;
             update();
          }
      }else if(scrollController.position.pixels>gk2Position){
         if( showSubHeaderTabs.value==true){
            showSubHeaderTabs.value=false;
             selectedTabsIndex.value=3;
             update();
          }
      }

      //显示隐藏顶部tab切换
      if (scrollController.position.pixels <= 100) {
        opcity.value = scrollController.position.pixels / 100;    
        if(opcity.value> 0.96){
          opcity.value=1;
        }
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

   //改变内容区域的tab切换
  void changeSelectedSubTabsIndex(index) {
    selectedSubTabsIndex.value = index;
    //跳转到指定位置
    scrollController.jumpTo(gk2Position);
    update();
  }

/*   
    把[{cate: 颜色, list: [土豪金, 玫瑰红, 磨砂黑]}, {cate: 内存, list: [16G, 32G, 64G]}]
变成map类型的对象

    [
      {
        cate: 颜色, 
        list: [
          {
            title:土豪金,
            checked:true
          },
          {
            title:玫瑰红,
            checked:false
          },{
            title:磨砂黑,
            checked:false

          }
        ]
      },
      {cate: 内存, 
      list: [
          {
             title:16G,
            checked:true        
          },
           {
             title:32G,
            checked:false        
          }
      ]}

    ]
  */

  //获取详情数据
  getContentData() async {
    var response =
        await httpsClient.get("api/pcontent?id=${Get.arguments["id"]}");
    if (response != null) {
      var tempData = PcontentModel.fromJson(response.data);
      pcontent.value = tempData.result!;
      pcontentAttr.value = pcontent.value.attr!;
      initAttr(pcontentAttr);
      update();
    }
  }

//初始化attr
  initAttr(List<PcontentAttrModel> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list!.length; j++) {
        if (j == 0) {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": true});
        } else {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": false});
        }
      }
    }
  }

//cate  颜色    title 玫瑰红
  changeAttr(cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if (pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          pcontentAttr[i].attrList![j]["checked"] = false;
          if (pcontentAttr[i].attrList![j]["title"] == title) {
            pcontentAttr[i].attrList![j]["checked"] = true;
          }
        }
      }
    }
    update();
  }
}
