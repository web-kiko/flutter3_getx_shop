import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ji_push_controller.dart';

class JiPushView extends GetView<JiPushController> {
  const JiPushView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JiPushView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JiPushView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
