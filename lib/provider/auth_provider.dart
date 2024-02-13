import 'dart:developer';

import '../core.dart';

class AuthProvider extends GetConnect {
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);

  Future<Response<ModelResponseLogin>> login(String email) {
    try {
      const String urlLogin = KeysEnpoint.login;
      log(urlLogin, name: "data url Product");
      final request = ModelUserRequest(email: email);
      return post(
        KeysEnpoint.login,
        request.toJson(),
      ).then((response) {
        log(response.bodyString!, name: 'data response login');
        // Convert JSON map to model
        HiveService hiveService = HiveService();
        final dataLogin = modelResponseLoginFromJson(response.bodyString!);
        hiveService.putIdCustomer(dataLogin.data.customer.id);
        hiveService.putEmail(dataLogin.data.customer.email);
        hiveService.putCustomerToken(dataLogin.data.token);
        return Response(
          body: modelResponseLoginFromJson(response.bodyString!),
        );
      }).onError(
        (error, stackTrace) => Future.error('$error $stackTrace'),
      );
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting login: $error';
    }
    // final request = ModelUserRequest(email: email);
    // return post(
    //   KeysEnpoint.login,
    //   request.toJson(),
    // ).then((response) {
    //   // Convert JSON map to model
    //   return Response(
    //     body: modelResponseLoginFromJson(response.bodyString!),
    //   );
    // }).onError(
    //   (error, stackTrace) => Future.error('$error $stackTrace'),
    // );
  }

  Future<Response<ModelResponseRegister>> register(String email) {
    final request = ModelUserRequest(email: email);
    return post(
      KeysEnpoint.register,
      request.toJson(),
    ).then((response) {
      log(response.bodyString!, name: 'data response regis');
      // Convert JSON map to model
      return Response(
        body: modelResponseRegisterFromJson(response.bodyString!),
      );
    }).onError(
      (error, stackTrace) => Future.error('$error $stackTrace'),
    );
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseURL;
  }
}
