import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_step_one_controller.dart';

class RegisterStepOneView extends GetView<RegisterStepOneController> {
  const RegisterStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterStepOneView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterStepOneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
