// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../../../core.dart';

class RegisterController extends GetxController {
  final AuthProvider authProvider;
  // final HiveService hiveService;
  RegisterController({
    required this.authProvider,
    // required this.hiveService,
  });

  final formkey = GlobalKey<FormState>();

  final cFormEmail = TextEditingController();
  final isLoading = false.obs;

  void loadingState() {
    isLoading.value = !isLoading.value;
  }

  Future register({required BuildContext context}) async {
    if (formkey.currentState!.validate()) {
      loadingState();
      authProvider.register(cFormEmail.text).then((value) {
        log(value.body.toString(), name: 'bodi regis');
        context.goLogin(arguments: cFormEmail.text);
        cFormEmail.clear();
        loadingState();
      });
    }
  }
}
