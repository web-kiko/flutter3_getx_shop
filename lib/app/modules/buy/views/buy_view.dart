import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tobias/tobias.dart';
import 'package:get/get.dart';

import '../../../units/screenAdapter.dart';
import '../../../widget/passButton.dart';
import '../controllers/buy_controller.dart';

class BuyView extends GetView<BuyController> {
  const BuyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('去支付'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        children: [
          Obx(()=>ListView.builder(
              itemCount: controller.buyList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: (){
                          controller.changeBuyList(index);
                      },
                      leading:
                          Image.network(controller.buyList[index]["image"]),
                      title: Text("${controller.buyList[index]["title"]}"),
                      trailing: controller.buyList[index]["chekced"]
                          ? Icon(Icons.check)
                          : Text(""),
                    ),
                    const Divider()
                  ],
                );
              })),
          SizedBox(
            height: ScreenAdapter.height(200),
          ),
          PassButton(
              text: "支付",
              onPressed: () {
                // print("支付");
                if(controller.buyType==0){
          
                  print("支付宝支付");
                  // Get.toNamed('/alipay');
                   _doAliPay();

                }else{
                  print("微信支付");
                }
              })
        ],
      ),
    );
  }
}
//支付宝支付
_doAliPay() async {
    var response = await Dio().get("https://agent.itying.com/alipay/");
    print(response.data);
    print(response.data is String);

    var aliPayResult = await aliPay(response.data);
    print(aliPayResult); //跳转到订单列表

    /*
      Unhandled Exception: MissingPluginException(No implementation found for method pay on channel com.jarvanmo/tobias)
      https://github.com/OpenFlutter/tobias/issues/65
    */
  }

