import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_step_two_controller.dart';

class RegisterStepTwoView extends GetView<RegisterStepTwoController> {
  const RegisterStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterStepTwoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterStepTwoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
