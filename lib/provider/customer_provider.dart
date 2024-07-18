import 'dart:developer';

import '../core.dart';

class CustomerProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);

  final PrefService _prefService = PrefService();

  Future<ModelIdCustomer> fetchIdCustomer(String id) async {
    try {
      final String urlProduct = '${KeysEnpoint.custamer}/$id';
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelIdCustomerFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  Future<ModelResponsePatchCustamer> patchCustomer(
      ModelRequestPatchCustamer input) async {
    try {
      final request = modelRequestPatchCustamerToJson(input);
      const String urlCustomer = KeysEnpoint.custamer;
      log(urlCustomer, name: "data url Product");
      final response = await patch(urlCustomer, request);
      if (response.statusCode == 200) {
        log(response.bodyString!, name: 'data response');
        return modelResponsePatchCustamerFromJson(response.bodyString!);
      } else {
        log(response.toString(), name: 'data error');
        throw Exception(
            'Failed to patch custamer. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      rethrow; // Melempar kembali error untuk ditangani oleh pemanggil
    }
  }

  @override
  void onInit() async {
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
