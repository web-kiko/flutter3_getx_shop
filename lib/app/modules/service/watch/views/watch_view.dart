import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/watch_controller.dart';

class WatchView extends GetView<WatchController> {
  const WatchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WatchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WatchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
