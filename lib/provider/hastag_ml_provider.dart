import 'dart:async';
import 'dart:developer';

import '../core.dart';


class HastagMlProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);
  final PrefService _prefService = PrefService();

  Future<ModelResponsePostHastagMl> postHastagMl(
      ModelRequestPostHastagMl input) async {
    try {
      final dataInput = modelRequestPostHastagMlToJson(input);
      final response = await post(
        KeysEnpoint.order,
        dataInput,
      );

      if (response.status.hasError) {
        throw Exception(
            'Failed to get order. Status Code: ${response.statusCode}');
      } else {
        return modelResponsePostHastagMlFromJson(response.bodyString!);
      }
    } catch (error) {
      log('Error getting order: $error');
      rethrow; // Rethrow the error to be handled by the caller
    }
  }

  @override
  void onInit() {
    _prefService.prefInit();
    httpClient.addRequestModifier<dynamic>((request) {
      final token = _prefService.getUserToken;
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });
    httpClient.baseUrl = baseURL;
    super.onInit();
  }
}
