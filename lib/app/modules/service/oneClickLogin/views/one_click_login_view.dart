import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/one_click_login_controller.dart';

class OneClickLoginView extends GetView<OneClickLoginController> {
  const OneClickLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OneClickLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OneClickLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
