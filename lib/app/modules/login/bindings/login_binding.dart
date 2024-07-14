import 'package:fresha_mobile/core.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthProvider(),
    );
    Get.lazyPut(
      () => PrefService(),
    );
    Get.put<LoginController>(
      LoginController(
        authProvider: Get.find(),
        prefService: Get.find(),
      ),
    );
  }
}
