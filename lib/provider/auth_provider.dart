import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../core.dart';

class AuthProvider extends GetConnect {
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);

  Future<ModelResponseLogin> login(ModelLoginRequest request) async {
    try {
      const String urlLogin = KeysEnpoint.login;
      log(urlLogin, name: "url login");
      final response = await post(
        KeysEnpoint.login,
        request.toJson(),
      );
      if (response.status.hasError) {
        final error = userResponseErrorFromJson(response.bodyString!);
        Get.defaultDialog(
          title: "info",
          middleText: error.errors.toString(),
        );
        log(error.toString(), name: 'error response');
        return Future.error('$response');
      } else {
        final dataLogin = modelResponseLoginFromJson(response.bodyString!);
        return dataLogin;
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting login: $error';
    }
  }

  Future<ModelResponseRegister> register(ModelRegisterRequest request) async {
    try {
      final response = await post(
        KeysEnpoint.register,
        request.toJson(),
      );
      if (response.status.hasError) {
        final error = userResponseErrorFromJson(response.bodyString!);
        Get.defaultDialog(
          title: "info",
          middleText: error.errors.toString(),
        );
        log(error.toString(), name: 'error response');
        return Future.error('$response');
      } else {
        final dataRegis = modelResponseRegisterFromJson(response.bodyString!);
        return dataRegis;
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting register: $error';
    }
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final email = googleUser!.email.toString();
    log(email, name: 'email');
    return email;
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseURL;
  }
}
