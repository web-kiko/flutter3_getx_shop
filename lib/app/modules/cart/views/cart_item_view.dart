import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../units/screenAdapter.dart';
import '../views/cart_item_mun_view.dart';

class CartItemView extends GetView {
  const CartItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.height(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(          
                    color: const Color.fromARGB(178, 240, 236, 236),
                    width: ScreenAdapter.height(2))),
          ),
      child: Row(
        children: [
          SizedBox(
            width: ScreenAdapter.width(100),
            child: Checkbox(
                activeColor: Colors.red, value: false, onChanged: (value) {}),
          ),
          Container(
            width: ScreenAdapter.width(260),
            padding: EdgeInsets.all(ScreenAdapter.height(24)),
            margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
            child: Image.network("https://www.itying.com/images/shouji.png",
                fit: BoxFit.fitHeight),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "小米11",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(36),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ScreenAdapter.height(20)),
              const Row(
                children: [Chip(label: Text("黑色"))],
              ),
              SizedBox(height: ScreenAdapter.height(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("¥98.9",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(38),
                          color: Colors.red)),
                  const CartItemMunView()
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
