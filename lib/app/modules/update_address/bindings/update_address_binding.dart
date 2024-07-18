import 'package:get/get.dart';

import '../controllers/update_address_controller.dart';

class UpdateAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAddressController>(
      () => UpdateAddressController(),
    );
  }
}
