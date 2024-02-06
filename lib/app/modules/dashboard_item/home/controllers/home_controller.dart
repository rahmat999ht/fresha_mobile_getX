import 'package:fresha_mobile/core.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }
}
