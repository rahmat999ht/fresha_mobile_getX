import '../../../../core.dart';
import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthProvider(),
    );
    // Get.lazyPut(
    //   () => HiveService(),
    // );
    Get.put<RegisterController>(
      RegisterController(
        authProvider: Get.find(),
        // hiveService: Get.find(),
      ),
    );
  }
}
