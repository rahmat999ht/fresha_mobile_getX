import 'dart:async';
import 'dart:developer';

import '../core.dart';

class OrderProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);

  Future<ModelOrderById> fetchIdOrder(String id) async {
    try {
      final String urlProduct = '${KeysEnpoint.orders}/$id';
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        log(response.bodyString!, name: 'data response');
        return modelOrderByIdFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting order: $error';
    }
  }

  // Post request
  Future<Response> postOrder(ModelProduct model) => post(
        KeysEnpoint.orders,
        model.data,
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

  Future<ModelOrders> fetchOrder() async {
    try {
      const String urlProduct = KeysEnpoint.orders;
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        log(response.bodyString!, name: 'data response');
        return modelOrdersFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting order: $error';
    }
  }

  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      const token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsc2VyY3BncDAwMDExMW5iNm04czlpcHQiLCJuYW1lIjpudWxsLCJlbWFpbCI6InJhaG1hdDk5OWh0QGdtYWlsLmNvbSIsInBob25lIjpudWxsLCJhZGRyZXNzIjpudWxsLCJlbWFpbFZlcmlmaWVkIjpudWxsLCJpbWFnZSI6bnVsbCwiaWF0IjoxNzA3NDg5ODM0LCJleHAiOjE3MDc3NDkwMzR9.FCJuXOkv3So2DWFf1WkPMSQHpytGx-98JrxiQW19-74';
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });
    httpClient.baseUrl = baseURL;
    super.onInit();
  }
}
