import 'dart:developer';

import '../../../../core.dart';

class LoginController extends GetxController {
  final AuthProvider authProvider;
  final HiveService hiveService;
  LoginController({
    required this.authProvider,
    required this.hiveService,
  });

  String argumentEmail = '';
  final formkey = GlobalKey<FormState>();
  final cFormEmail = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      argumentEmail = Get.arguments;
      cFormEmail.text = argumentEmail;
      log(argumentEmail, name: 'get Argument login');
    }

    super.onInit();
  }

  void loadingState() {
    isLoading.value = !isLoading.value;
  }

  Future login({required BuildContext context}) async {
    if (formkey.currentState!.validate()) {
      loadingState();
      await authProvider.login(cFormEmail.text);
      await Get.toNamed(Routes.DASHBOARD);
      // context.goDasboard();
      loadingState();
    }
  }
}
