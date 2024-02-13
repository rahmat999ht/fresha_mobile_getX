import 'package:fresha_mobile/core.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthProvider(),
    );
    Get.lazyPut(
      () => HiveService(),
    );
    Get.put<LoginController>(
      LoginController(
        authProvider: Get.find(),
        hiveService: Get.find(),
      ),
    );
  }
}
