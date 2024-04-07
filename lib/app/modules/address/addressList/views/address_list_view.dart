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
              Obx(() => controller.addressList.isNotEmpty
                  ? ListView(
                    //显示默认地址
                      children: controller.addressList.map((value) {
                      return value.defaultAddress == 1
                          ? Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.check,
                                    color: Colors.red,
                                  ),
                                  title: InkWell(
                                    //修改默认地址
                                      onTap: () {
                                        controller
                                            .changeDefaultAddress(value.sId);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${value.address}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenAdapter.fontSize(48)),
                                          ),
                                          SizedBox(
                                              height: ScreenAdapter.height(24)),
                                          Text("${value.name}  ${value.phone}"),
                                        ],
                                      )),
                                  trailing: IconButton(
                                      onPressed: () {
                                        Get.toNamed("/address-edit",
                                        //为了修改页面需要传递
                                            arguments: {
                                              "id": value.sId,
                                              "name": value.name,
                                              "phone": value.phone,
                                              "address": value.address
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      )),
                                ),
                                const Divider(),
                                SizedBox(height: ScreenAdapter.height(30))
                              ],
                            )
                          : Column(
                              children: [
                                ListTile(
                                  title: InkWell(
                                    //删除收货地址
                                    onLongPress: () {
                                      Get.defaultDialog(
                                          title: "提示信息!",
                                          middleText: "您确定要删除吗?",
                                          confirm: ElevatedButton(
                                              onPressed: () {
                                                controller.deleteAddress(value.sId);
                                                Get.back();
                                              },
                                              child: const Text("确定")),
                                          cancel: ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text("取消")));
                                    },
                                    onTap: () {
                                      controller
                                          .changeDefaultAddress(value.sId);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${value.address}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenAdapter.fontSize(48)),
                                        ),
                                        SizedBox(
                                            height: ScreenAdapter.height(24)),
                                        Text("${value.name}  ${value.phone}"),
                                      ],
                                    ),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        Get.toNamed("/address-edit",
                                            arguments: {
                                              "id": value.sId,
                                              "name": value.name,
                                              "phone": value.phone,
                                              "address": value.address
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      )),
                                ),
                                const Divider(),
                                SizedBox(height: ScreenAdapter.height(30))
                              ],
                            );
                    }).toList())
                  : const Center(
                      child: Text("请添加收货地址哦"),
                    )),
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
                          color: Color.fromRGBO(251, 72, 5, 0.9),
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
