import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_address_controller.dart';

class UpdateAddressView extends GetView<UpdateAddressController> {
  const UpdateAddressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateAddressView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpdateAddressView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
