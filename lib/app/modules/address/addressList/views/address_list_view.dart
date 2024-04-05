import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../units/screenAdapter.dart';
import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  const AddressListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: const Text('收货地址'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(40)),
          child: Stack(
            children: [
              ListView(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.check,
                      color: Colors.red,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "北京市 海淀区",
                          style: TextStyle(
                             color: Colors.black54),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        Text(
                          "西二旗 盈创动力大厦",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenAdapter.fontSize(48)),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        const Text("张三  15201681234"),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: ScreenAdapter.height(30)),
                   ListTile(                  
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "北京市 海淀区",
                          style: TextStyle(
                             color: Colors.black54),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        Text(
                          "西二旗 盈创动力大厦",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenAdapter.fontSize(48)),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        const Text("张三  15201681234"),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: ScreenAdapter.height(30)),
                  ListTile(                  
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "北京市 海淀区",
                          style: TextStyle(
                             color: Colors.black54),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        Text(
                          "西二旗 盈创动力大厦",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenAdapter.fontSize(48)),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        const Text("张三  15201681234"),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: ScreenAdapter.height(30)),
                  ListTile(                  
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "北京市 海淀区",
                          style: TextStyle(
                             color: Colors.black54),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        Text(
                          "西二旗 盈创动力大厦",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenAdapter.fontSize(48)),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        const Text("张三  15201681234"),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: ScreenAdapter.height(30)),
                  ListTile(                  
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "北京市 海淀区",
                          style: TextStyle(
                             color: Colors.black54),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        Text(
                          "西二旗 盈创动力大厦",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenAdapter.fontSize(48)),
                        ),
                        SizedBox(height: ScreenAdapter.height(24)),
                        const Text("张三  15201681234"),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: ScreenAdapter.height(30))
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/address-add");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(251, 72, 5, 0.9),
                          borderRadius: BorderRadius.circular(20)),
                      height: ScreenAdapter.height(140),
                      alignment: Alignment.center,
                      child: const Text(
                        "新建收货地址",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
