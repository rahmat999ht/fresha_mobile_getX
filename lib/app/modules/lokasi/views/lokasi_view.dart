import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lokasi_controller.dart';

class LokasiView extends GetView<LokasiController> {
  const LokasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LokasiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LokasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
