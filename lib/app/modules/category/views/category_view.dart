import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../services/screenAdapter.dart'; //适配
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
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
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_outlined, color: Colors.black45))
        ],
        elevation: 0,
      ),
     body: Row(
        children: [
          SizedBox(
            width: ScreenAdapter.width(280),
            height: double.infinity,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return Container(
                    width: double.infinity,
                    height: ScreenAdapter.height(180),
                    child: Obx(() => InkWell(
                          onTap: () {
                             controller.changeIndex(index);
                          },
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: ScreenAdapter.width(10),
                                  height: ScreenAdapter.height(46),
                                  color: controller.selectIndex.value == index
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                              Center(
                                child: Text("第$index个"),
                              )
                            ],
                          ),
                        )),
                  );
                })),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            child: GridView.builder(
                itemCount: 35,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: ScreenAdapter.width(40),
                    mainAxisSpacing:ScreenAdapter.height(20) ,
                    childAspectRatio: 240 / 340),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Image.network(
                            "https://miapp.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png",
                            fit: BoxFit.fitHeight),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, ScreenAdapter.height(10), 0, 0),
                        child: Text("手机",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34))),
                      )
                    ],
                  );
                })),
          ))
        ],
      ),
    );
  }
}
