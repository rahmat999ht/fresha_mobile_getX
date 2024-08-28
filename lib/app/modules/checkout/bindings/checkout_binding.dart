import 'package:fresha_mobile/core.dart';
import 'package:fresha_mobile/provider/hastag_ml_provider.dart';

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
    Get.lazyPut<ProductProvider>(
          () => ProductProvider(),
    );
    Get.lazyPut<HastagMlProvider>(
          () => HastagMlProvider(),
    );
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(
        hastagMlProvider: Get.find(),
        productProvider: Get.find(),
        orderProvider: Get.find(),
        prefService: Get.find(),
      ),
    );
  }
}
