import 'dart:developer';

import 'package:fresha_mobile/core.dart';

import '../../../../../provider/customer_provider.dart';

class AkunController extends GetxController with StateMixin<DataCustomer> {
  final PrefService prefService;
  final CustomerProvider customerProvider;

  AkunController({
    required this.prefService,
    required this.customerProvider,
  });

  final isLogin = false.obs;

  void setLoginValue(bool value) => isLogin.value = value;

  void toDaftar() => Get.toNamed(Routes.REGISTER);

  void toUpdateProfil(DataCustomer data) => Get.toNamed(
        Routes.UPDATE_PROFILE,
        arguments: data,
      );

  void toUpdateAlamat() => Get.toNamed(Routes.UPDATE_ADDRESS);

  @override
  void onInit() async {
    await prefService.prefInit();
    if (prefService.getIdCustomer != null) {
      setLoginValue(true);
      findAllProduct(prefService.getIdCustomer.toString());
    } else {
      setLoginValue(false);
      change(<DataCustomer>{} as DataCustomer?, status: RxStatus.empty());
    }
    super.onInit();
  }

  Future loOut() async {
    Get.defaultDialog(
      title: "Peringatan",
      middleText: "Apakah anda yakin ingin keluar",
      onCancel: Get.back,
      onConfirm: () async {
        await prefService.clearAllData();
        Get.offAllNamed(Routes.DASHBOARD);
        Get.snackbar(
          "Info",
          "Anda Berhasil Keluar",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      },
    );
  }

  Future findAllProduct(String idCustamer) async {
    customerProvider.fetchIdCustomer(idCustamer).then((result) {
      if (result.code == 200) {
        // log(result.toString(), name: 'data model');
        change(result.data, status: RxStatus.success());
      } else {
        change(<DataCustomer>{} as DataCustomer?, status: RxStatus.empty());
        log('kosong', name: 'data kosong');
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
