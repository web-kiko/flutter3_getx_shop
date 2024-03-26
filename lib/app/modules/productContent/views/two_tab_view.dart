/*
 * @ Author: kiko
 * @ Create Time: 2024-03-24 00:43:39
 * @ Modified by: kiko
 * @ Modified time: 2024-03-27 01:48:29
 * @ Description:
 */

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import '../../../units/screenAdapter.dart';
import '../controllers/product_content_controller.dart';


class TwoTabView extends GetView {
  @override
   final ProductContentController controller = Get.find();
   final Function subHeader; 
  TwoTabView(this.subHeader, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      alignment: Alignment.center,
      width: ScreenAdapter.width(1080),
    child: Obx(()=> controller.pcontent.value.content!=null?Column(
        children: [
          subHeader(),

          controller.selectedSubTabsIndex.value==1?SizedBox(
              width: ScreenAdapter.width(1080),
              child: Html(
                    data: controller.pcontent.value.content,
                    style: {
                      "body":Style(
                        backgroundColor: Colors.white
                      ),
                      "p":Style(
                        fontSize: FontSize.large
                      ),
                    },
                  )                  
          ):SizedBox(
              width: ScreenAdapter.width(1080),
              child: Html(
                    data: controller.pcontent.value.specs,
                    style: {
                      "body":Style(
                        backgroundColor: Colors.white
                      ),
                      "p":Style(
                        fontSize: FontSize.large
                      ),
                    },
                  ),
          )
        ],
      ):const Text("")),
    );
  }
}
