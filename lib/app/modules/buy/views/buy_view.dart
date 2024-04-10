import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buy_controller.dart';

class BuyView extends GetView<BuyController> {
  const BuyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BuyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
