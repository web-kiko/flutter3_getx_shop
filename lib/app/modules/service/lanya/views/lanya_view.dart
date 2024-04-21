import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lanya_controller.dart';

class LanyaView extends GetView<LanyaController> {
  const LanyaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanyaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LanyaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
