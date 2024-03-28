import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../units/screenAdapter.dart';

class CartItemMunView extends GetView {
  final Map cartItem;
  const CartItemMunView(this.cartItem,{Key? key}) : super(key: key);

    Widget _left(){
      return Container(
            alignment: Alignment.center,
            width:ScreenAdapter.width(80) ,
            height: ScreenAdapter.height(64),
            child: const Text("-"),
          );
  }
    Widget _center(){
      return Container(
        
         decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: ScreenAdapter.width(2),color: Colors.black12),
              right: BorderSide(width: ScreenAdapter.width(2),color: Colors.black12),
            )
      ),
            alignment: Alignment.center,
            width:ScreenAdapter.width(80) ,
            height: ScreenAdapter.height(64),
            child:  Text("${cartItem["count"]}"),
          );
  }
    Widget _right(){
      return Container(
            alignment: Alignment.center,
            width:ScreenAdapter.width(80) ,
             height: ScreenAdapter.height(64),
            child: const Text("+"),
          );
  }
  @override
  Widget build(BuildContext context) {
     return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(60),
      decoration: BoxDecoration(
        border: Border.all(
          width: ScreenAdapter.width(2),
          color: Colors.black12
        )
      ),
      child: Row(
        children: [
          _left(),
           _center(),
           _right()

        ],
      ),
    );
  }
}
