/*
 * @Author: web-kiko kikoiiii@163.com
 * @Date: 2024-03-15 19:32:07
 * @LastEditors: web-kiko kikoiiii@163.com
 * @LastEditTime: 2024-03-16 02:07:34
 * @FilePath: \flutter3_getx_shop\lib\app\modules\serach\views\serach_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/serach_controller.dart';
import '../../../units/screenAdapter.dart';

class SerachView extends GetView<SerachController> {
  const SerachView({Key? key}) : super(key: key);
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
          child: TextField(
            //获得焦点，弹出flutter的键盘
            autofocus: true,
            style: TextStyle(
                //修改框框的字体
                fontSize: ScreenAdapter.fontSize(36)),
            decoration: InputDecoration(
                //配置padding值
                contentPadding: const EdgeInsets.all(0),

                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none)),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                print("搜索");
              },
              child: Text("搜索",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(36))))
        ],
        elevation: 0,
      ),
      body: ListView(
         padding: EdgeInsets.all(ScreenAdapter.height(20)),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("搜索历史",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42))),
                const Icon(Icons.delete_forever_outlined)
              ],
            ),
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("手机"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("笔记本"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
             
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
            
            ],
          ),
          const SizedBox(height: 20),
           Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("猜你想搜",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42))),
                const Icon(Icons.refresh)
              ],
            ),
          ),
          Wrap(
            children: [
              
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("手机"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("笔记本"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("手机"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("笔记本"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
            ],
          ),
 const SizedBox(height: 20),
          //热销商品

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child:Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(138),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/hot_search.png")
                      )
                  ),
                ),
                Container(      
                   padding: EdgeInsets.all(ScreenAdapter.width(20)),          
                  child: GridView.builder(
                   shrinkWrap: true,  //收缩
                   itemCount: 8,   //必须设置
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: ScreenAdapter.width(40),
                            mainAxisSpacing: ScreenAdapter.height(20),
                            childAspectRatio: 3 / 1),
                    itemBuilder: ((context, index) {
                        return Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: ScreenAdapter.width(120),
                                padding: EdgeInsets.all(ScreenAdapter.width(10)),
                                child: Image.network("https://www.itying.com/images/shouji.png",fit: BoxFit.fitHeight,),
                              ),
                              Expanded(child: Container(
                                padding: EdgeInsets.all(ScreenAdapter.width(10)),
                                alignment: Alignment.topLeft,
                                child: const Text("小米净化器 热水器 小米净化器"),
                              ))
                            ],
                        );
                    })),
                )
              ],
            ) ,
          )
        
        
        ],
      ),
    );
  }
}

