import 'dart:async';
import 'dart:developer';

import 'package:fresha_mobile/model/order/form_post_order.dart';

import '../core.dart';

class OrderProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);
  final PrefService _prefService = PrefService();

  Future<ModelResponseOrderId> fetchIdOrder(String id) async {
    try {
      final String urlProduct = '${KeysEnpoint.orders}/$id';
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
  Future<Response> postOrder(FormOrderPost input) => post(
        KeysEnpoint.orders,
        input,
      );
  // Get request Product
  Future getOrderPage(int page) async {
    try {
      final String urlProduct = '${KeysEnpoint.orders}?page=$page';
      // final urlProductParse = Uri.parse(urlProduct);
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        throw 'Failed to get order. Status Code: ${response.statusCode}';
      }
      log(response.toString(), name: "data rerponse Product");
      return response;
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting order: $error';
    }
  }

  Future<ModelResponseOrderByCustamer> fetchOrderByIdCustamer(
      String idCustamer) async {
    try {
      const String urlOrder = KeysEnpoint.orders;
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
