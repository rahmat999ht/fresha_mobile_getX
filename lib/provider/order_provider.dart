import 'dart:async';
import 'dart:developer';

import 'package:fresha_mobile/model/order/model_request_post_order.dart';

import '../core.dart';

class OrderProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);
  final PrefService _prefService = PrefService();

  Future<ModelResponseOrderId> fetchIdOrder(String id) async {
    try {
      final String urlProduct = '${KeysEnpoint.order}/$id';
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelResponseOrderIdFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting order: $error';
    }
  }

  // Post request
  Future<ModelResponsePostOrder> postOrder(ModelRequestPostOrder input) async {
    try {
      // _prefService.prefInit();
      // final token = _prefService.getUserToken;
      final dataInput = modelRequestPostOrderToJson(input);
      final response = await post(
        KeysEnpoint.order,
        dataInput,
        // headers: {'Authorization': "Bearer $token"},
      );
      log(response.statusCode.toString(), name: "statusCode post order");
      if (response.status.hasError) {
        throw Exception(
            'Failed to get order. Status Code: ${response.statusCode}');
      } else {
        return modelResponsePostOrderFromJson(response.bodyString!);
      }
    } catch (error) {
      log('Error getting order: $error');
      rethrow; // Rethrow the error to be handled by the caller
    }
  }

  Future<ModelResponseOrderByCustamer> fetchOrderByIdCustamer(
      String idCustamer) async {
    try {
      const String urlOrder = KeysEnpoint.order;
      log(urlOrder, name: "data url Product");
      final response = await get('$urlOrder?id_cus=$idCustamer');
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelResponseOrderByCustamerFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting order: $error';
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
