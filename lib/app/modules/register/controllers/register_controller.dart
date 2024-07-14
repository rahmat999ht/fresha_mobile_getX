// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../../../core.dart';

class RegisterController extends GetxController {
  final AuthProvider authProvider;
  RegisterController({
    required this.authProvider,
  });

  final formkey = GlobalKey<FormState>();

  final cFormEmail = TextEditingController();
  final cFormName = TextEditingController();
  final isLoading = false.obs;
  var isEmailMessage = ''.obs;
  var isNameMessage = ''.obs;

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

  String _validatenName(String name) {
    if (nullValidation(name)) {
      return isNameMessage.value = 'Name harap di isi';
    }
    return isEmailMessage.value = '';
  }

  Future register() async {
    _validatenName(cFormName.text);
    _validateEmail(cFormEmail.text);
    if (isEmailMessage.value.isEmpty && isNameMessage.value.isEmpty) {
      loadingState();
      final request = ModelRegisterRequest(
        name: cFormName.text,
        email: cFormEmail.text,
      );
      final response = await authProvider.register(request);
      if (response.code == 200) {
        log(response.data.toString(), name: 'bodi regis');
        cFormEmail.clear();
        cFormName.clear();
        loadingState();
        Get.toNamed(
          Routes.LOGIN,
          arguments: response.data.email,
        );
      }
    }
  }
}
