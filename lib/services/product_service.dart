import 'dart:developer';

import '../core.dart';

class ProductProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);
  // final String baseURL = "http://192.168.1.12:3000/api";

  Future<ModelIdProduct> fetchIdProducts(String id) async {
    try {
      final String urlProduct = '${KeysEnpoint.products}/$id';
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        log(response.bodyString!, name: 'data response');
        return modelIdProductFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  // Post request
  Future<Response> postUser(ModelProduct model) => post(
        '$baseURL/${KeysEnpoint.products}',
        model.data,
      );
  // Get request Product
  Future getProductPage(int page) async {
    try {
      final String urlProduct = '${KeysEnpoint.products}?page=$page';
      // final urlProductParse = Uri.parse(urlProduct);
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        throw 'Failed to get products. Status Code: ${response.statusCode}';
      }
      log(response.toString(), name: "data rerponse Product");
      return response;
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  Future<ModelProduct> fetchProducts() async {
    try {
      const String urlProduct = KeysEnpoint.products;
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        log(response.bodyString!, name: 'data response');
        return modelProductFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) {
    //     log("Data = ${map.toString()}", name: "jjj");
    //     return ModelIdProduct.fromJson(map);
    //   }
    //   if (map is List) {
    //     return map.map((item) {
    //       // log(item ?? "ko", name: "jjj");
    //       return modelProductFromJson(item);
    //     }).toList();
    //   }
    // };
    // httpClient.addRequestModifier((request) {
    //   request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
    //   return request;
    // });
    httpClient.baseUrl = baseURL;
  }
}
