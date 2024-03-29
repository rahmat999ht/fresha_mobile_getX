import 'package:fresha_mobile/app/modules/dashboard_item/akun/controllers/akun_controller.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/home/controllers/home_controller.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/kategori/controllers/kategori_controller.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/pesanan/controllers/pesanan_controller.dart';
import 'package:fresha_mobile/core.dart';

import '../../dashboard_item/products/controllers/products_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductProvider(),
    );
    Get.lazyPut(
      () => OrderProvider(),
    );
    Get.put<ProductsController>(
      ProductsController(productProvider: Get.find()),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<KategoriController>(
      KategoriController(
        productProvider: Get.find(),
      ),
    );
    Get.put<PesananController>(
      PesananController(orderProvider: Get.find()),
    );
    Get.lazyPut<AkunController>(
      () => AkunController(),
    );
  }
}
