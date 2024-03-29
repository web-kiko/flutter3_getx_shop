import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/code_login_step_two_controller.dart';

class CodeLoginStepTwoView extends GetView<CodeLoginStepTwoController> {
  const CodeLoginStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CodeLoginStepTwoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CodeLoginStepTwoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
