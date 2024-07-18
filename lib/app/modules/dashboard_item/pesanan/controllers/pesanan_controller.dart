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

  final itemDone = 0.obs;
  final itemProcessed = 0.obs;

  @override
  void onInit() {
    findAllProduct(prefService.getIdCustomer.toString());
    super.onInit();
  }

  Future findAllProduct(String? idCustamer) async {
    if (idCustamer == null) {
      log(idCustamer.toString(), name: 'idCus');
      change([], status: RxStatus.empty());
    } else {
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
}
class ModelDataRiwayatPesanan{
  final String title;
  final List<DataOrderByCustamer> value;

  ModelDataRiwayatPesanan({required this.title, required this.value});
}
