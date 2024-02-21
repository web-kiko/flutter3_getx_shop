import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TabsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
