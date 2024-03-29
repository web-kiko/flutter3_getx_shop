import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pass_login_controller.dart';

class PassLoginView extends GetView<PassLoginController> {
  const PassLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PassLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PassLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
