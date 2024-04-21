import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wift_controller.dart';

class WiftView extends GetView<WiftController> {
  const WiftView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WiftView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WiftView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
