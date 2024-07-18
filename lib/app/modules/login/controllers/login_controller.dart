import 'dart:async';
import 'dart:developer';

import '../../../../core.dart';

class LoginController extends GetxController {
  final AuthProvider authProvider;
  final PrefService prefService;
  LoginController({
    required this.authProvider,
    required this.prefService,
  });

  String argumentEmail = '';
  final formkey = GlobalKey<FormState>();
  final cFormEmail = TextEditingController();
  final isLoading = false.obs;
  var isEmailMessage = ''.obs;

  void setFormEmail(String value) => cFormEmail.text = value;

  void loadingState() => isLoading.value = !isLoading.value;

  Future popUpGoogleAkun() async {
    final email = await authProvider.signInWithGoogle();
    setFormEmail(email);
    log(cFormEmail.text, name: 'cformEmail');
  }

  bool nullValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  String _validateEmail(String email) {
    if (nullValidation(email)) {
      return isEmailMessage.value = 'Email harap di isi';
    }
    // Regex untuk validasi email
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return isEmailMessage.value = 'Format email tidak valid';
    }
    return isEmailMessage.value = '';
  }

  Future login({required BuildContext context}) async {
    _validateEmail(cFormEmail.text);
    if (isEmailMessage.value.isEmpty) {
      loadingState();
      final request = ModelLoginRequest(email: cFormEmail.text);
      final response = await authProvider.login(request);
      if (response.code == 200) {
        prefService.putUserToken(response.data.token);
        prefService.putIdCustomer(response.data.costumer.id);
        log(response.data.token, name: 'token login');
        log(response.data.costumer.id, name: 'idCustamer login');
        Timer.periodic(const Duration(seconds: 3), (timer) {
          log(prefService.getIdCustomer.toString(), name: "idCustamer");
          log(prefService.getUserToken.toString(), name: "token");
          timer.cancel();
        });
        cFormEmail.clear();
        loadingState();
        Get.offAllNamed(Routes.DASHBOARD);
      }
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      argumentEmail = Get.arguments;
      cFormEmail.text = argumentEmail;
      log(argumentEmail, name: 'get Argument login');
    }
    prefService.removeUserToken();
    prefService.removeIdCustomer();

    super.onInit();
  }
}
