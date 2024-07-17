import 'package:fresha_mobile/core.dart';
import 'package:fresha_mobile/core.dart';
import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderProvider>(
      () => OrderProvider(),
    );
    Get.lazyPut<PrefService>(
          () => PrefService(),
    );
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(
        orderProvider: Get.find(),
        prefService: Get.find(),
      ),
    );
  }
}
