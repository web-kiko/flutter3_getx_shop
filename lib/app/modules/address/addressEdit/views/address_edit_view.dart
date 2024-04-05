import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_edit_controller.dart';

class AddressEditView extends GetView<AddressEditController> {
  const AddressEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddressEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddressEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
