import 'package:fresha_mobile/app/modules/dashboard_item/akun/controllers/akun_controller.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/home/controllers/home_controller.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/kategori/controllers/kategori_controller.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/pesanan/controllers/pesanan_controller.dart';
import 'package:fresha_mobile/core.dart';
import 'package:fresha_mobile/provider/customer_provider.dart';
import 'package:fresha_mobile/provider/hastag_ml_provider.dart';

import '../../dashboard_item/products/controllers/products_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PrefService(),
    );
    Get.lazyPut(
      () => ProductProvider(),
    );
    Get.lazyPut(
      () => OrderProvider(),
    );
    Get.lazyPut(
      () => CustomerProvider(),
    );
    Get.lazyPut(
      () => HastagMlProvider(),
    );
    Get.lazyPut<ProductsController>(
      () => ProductsController(
        productProvider: Get.find(),
        hastagMlProvider: Get.find(),
        prefService: Get.find(),
      ),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        prefService: Get.find(),
      ),
    );
    Get.lazyPut<KategoriController>(
      () => KategoriController(
        productProvider: Get.find(),
      ),
    );
    Get.lazyPut<PesananController>(
      () => PesananController(
        orderProvider: Get.find(),
        prefService: Get.find(),
      ),
    );
    Get.lazyPut<AkunController>(
      () => AkunController(
        prefService: Get.find(),
        customerProvider: Get.find(),
      ),
    );
  }
}
