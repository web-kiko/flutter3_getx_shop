import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_step_three_controller.dart';

class RegisterStepThreeView extends GetView<RegisterStepThreeController> {
  const RegisterStepThreeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterStepThreeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterStepThreeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
