import 'dart:developer';

import '../../../../../core.dart';

class ProductsController extends GetxController with StateMixin<ModelProduct> {
  final ProductProvider productProvider;
  ProductsController({required this.productProvider});

  Future findAllProduct() async {
    productProvider.fetchProducts().then((result) {
      if (result.code == 200) {
        log(result.toString(), name: 'data model');
        change(result, status: RxStatus.success());
      } else {
        log('kosong', name: 'data kosong');
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    findAllProduct();
    super.onInit();
  }
}
