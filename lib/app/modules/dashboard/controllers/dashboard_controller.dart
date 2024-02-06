import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;
  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  // void loadingState() {
  //   change(
  //     null,
  //     status: RxStatus.loading(),
  //   );
  // }

  // void successState(dynamic userLogin) {
  //   change(
  //     userLogin,
  //     status: RxStatus.success(),
  //   );
  // }
}
