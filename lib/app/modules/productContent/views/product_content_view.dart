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
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(96)),
        child: Obx(() => AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: SizedBox(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.width(88),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    //注意:去掉button默认的padding
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder())),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
              )),
        ),
        title: SizedBox(
          width: ScreenAdapter.width(400),
          height: ScreenAdapter.height(96),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding:const  EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "商品",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                        width: ScreenAdapter.width(100),
                        height: ScreenAdapter.height(2),
                        color: Colors.red,
                      )
                    ],
                  )),   
                 Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "详情",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                        width: ScreenAdapter.width(100),
                        height: ScreenAdapter.height(2),
                        color: Colors.red,
                      )
                    ],
                  )),
                   Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "推荐",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
                        width: ScreenAdapter.width(100),
                        height: ScreenAdapter.height(2),
                        color: Colors.red,
                      )
                    ],
                  )),              
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(controller.opcity.value), //实现透明导航
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
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder())),
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
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder())),
                child: const Icon(
                  Icons.more_horiz_rounded,
                )),
          ),
        ],
      ),
      )
      
      ) ,
      body: ListView(
        controller: controller.scrollController,
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(300),
            color: Colors.orange,
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
            Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(300),
            color: Colors.orange,
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
            Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(300),
            color: Colors.red,
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
           Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(300),
            color: Colors.blue,
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
          ListTile(
            title: Text("我是一个内容列表"),
          ),
        ],
      ),
    );
  }
}
