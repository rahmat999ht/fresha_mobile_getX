// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fresha_mobile/app/modules/dashboard_item/products/controllers/products_controller.dart';
import 'package:fresha_mobile/core.dart';

class HomeController extends GetxController {
  final PrefService prefService;
  HomeController({
    required this.prefService,
  });

  final isLogin = false.obs;
  final selectedIndex = 0.obs;
  final searchC = TextEditingController();
  final swiperC = SwiperController();
  final isSearch = false.obs;

  final controllerProduct = Get.find<ProductsController>();

  @override
  void onReady() async {
    await prefService.prefInit();
    selectedIndex.value = 0;
    if (prefService.getIdCustomer != null) {
      log(prefService.getIdCustomer.toString(), name: "idCus Login");
      isLogin.value = true;
    }
    super.onReady();
  }
}
