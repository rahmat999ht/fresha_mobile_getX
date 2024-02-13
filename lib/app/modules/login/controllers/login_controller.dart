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
      authProvider.login(cFormEmail.text).then((value) {
        log(value.body!.data.customer.toString(), name: 'customer login');
        log(value.body!.data.token.toString(), name: 'token login');

        hiveService.putEmail(cFormEmail.text);
        hiveService.putIdCustomer(value.body!.data.customer.id);
        hiveService.putCustomerToken(value.body!.data.token);
        context.goDasboard();
        cFormEmail.clear();
        loadingState();
      }).onError((error, stackTrace) {
        loadingState();
        log(error.toString() + stackTrace.toString(), name: 'error login');
      });
    }
  }
}
