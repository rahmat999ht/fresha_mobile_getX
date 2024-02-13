import 'dart:developer';

import '../../../../../core.dart';

class PesananController extends GetxController with StateMixin<ModelOrders> {

  final OrderProvider orderProvider;
  final ProductProvider productProvider;
  PesananController({required this.orderProvider, required this.productProvider,});

  @override
  void onInit() {
    findAllProduct();
    super.onInit();
  }

  Future findAllProduct() async {
    orderProvider.fetchOrder().then((result) {
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
}
