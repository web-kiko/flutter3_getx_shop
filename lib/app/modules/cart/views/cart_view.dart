/*
 * @Descripttion: 
 * @version: 
 * @Author: kiko
 * @Date: 2024-02-21 11:11:37
 * @LastEditors: kiko
 * @LastEditTime: 2024-02-22 16:39:02
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../../../units/screenAdapter.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(600),
            color: Colors.yellow,
            child: Text(
              "手机",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
            ),
          )
        ],
      ),
    );
  }
}
