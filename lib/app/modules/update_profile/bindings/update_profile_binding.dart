import 'package:get/get.dart';

import '../../../../core.dart';
import '../../../../provider/customer_provider.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => PrefService(),
    );
    Get.lazyPut(
          () => CustomerProvider(),
    );
    Get.lazyPut<UpdateProfileController>(
      () => UpdateProfileController(
        customerProvider: Get.find(),
        prefService: Get.find(),
      ),
    );
  }
}
