import 'dart:developer';

import '../../../../../core.dart';

class PesananController extends GetxController
    with StateMixin<List<DataOrderByCustamer>> {
  final OrderProvider orderProvider;
  final PrefService prefService;

  PesananController({
    required this.orderProvider,
    required this.prefService,
  });

  @override
  void onInit() {
    if (prefService.getIdCustomer != null) {
      findAllProduct(prefService.getIdCustomer.toString());
    } else {
      change([], status: RxStatus.empty());
    }
    super.onInit();
  }

  Future findAllProduct(String idCustamer) async {
    orderProvider.fetchOrderByIdCustamer(idCustamer).then((result) {
      if (result.code == 200) {
        // log(result.toString(), name: 'data model');
        change(result.data, status: RxStatus.success());
      } else {
        log('kosong', name: 'data kosong');
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
