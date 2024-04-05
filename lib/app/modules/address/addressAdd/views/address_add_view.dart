import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../units/screenAdapter.dart';
import '../controllers/address_add_controller.dart';
import 'package:city_pickers/city_pickers.dart';

class AddressAddView extends GetView<AddressAddController> {
  const AddressAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('新建收货地址'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: ScreenAdapter.width(20)),
        children: [
          Container(
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("姓名",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(46))),
                    SizedBox(width: ScreenAdapter.width(40)),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42)),
                              hintText: "请输入姓名",
                              border: InputBorder.none),
                        ))
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("电话",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(46))),
                    SizedBox(width: ScreenAdapter.width(40)),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42)),
                              hintText: "请输入电话",
                              border: InputBorder.none),
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: ScreenAdapter.height(40)),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: ScreenAdapter.height(140),
                  child: InkWell(
                    onTap: () async {
                      // type 1
                      Result? result = await CityPickers.showCityPicker(
                        context: context,
                      );
                      //  // type 2
                      // Result? result = await CityPickers.showFullPageCityPicker(
                      //   context: context,
                      // );

                      if (result != null) {
                        print(
                            "${result.provinceName} ${result.cityName} ${result.areaName}");

                        controller.setArea(
                            "${result.provinceName} ${result.cityName} ${result.areaName}");
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("所在地区",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(46))),
                        SizedBox(width: ScreenAdapter.width(40)),
                        Expanded(
                            flex: 1,
                            child: Obx(() => Text(
                                controller.area.value == ""
                                    ? "所在地区"
                                    : controller.area.value,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ScreenAdapter.fontSize(42)))))
                      ],
                    ),
                  ),
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("详细地址",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(46))),
                    SizedBox(width: ScreenAdapter.width(40)),
                    Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42)),
                              hintText: "请输入详细地址",
                              border: InputBorder.none),
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: ScreenAdapter.height(200)),
          Padding(
            padding: EdgeInsets.all(ScreenAdapter.width(40)),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(251, 72, 5, 0.9),
                    borderRadius: BorderRadius.circular(20)),
                height: ScreenAdapter.height(140),
                alignment: Alignment.center,
                child: const Text(
                  "保存",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
