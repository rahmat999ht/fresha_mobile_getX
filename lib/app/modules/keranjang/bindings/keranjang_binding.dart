import '../../../../core.dart';
import '../controllers/keranjang_controller.dart';

class KeranjangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductProvider(),
    );
    Get.put<KeranjangController>(
      KeranjangController(
        productProvider: Get.find(),
      ),
    );
  }
}
