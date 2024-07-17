import 'dart:developer';

import '../core.dart';

class ProductProvider extends GetConnect {
  // baseUrl
  final String baseURL = dotenv.get(KeysEnpoint.baseUrl);

  Future<ModelProductById> fetchIdProducts(String id) async {
    try {
      final String urlProduct = '${KeysEnpoint.product}/$id';
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelProductByIdFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  // Get request Product
  Future getProductPage(int page) async {
    try {
      final String urlProduct = '${KeysEnpoint.product}?page=$page';
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
      const String urlProduct = KeysEnpoint.product;
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelProductFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  Future<ModelResponseProductWhereHastagMl> fetchProductsWhereHastag({
    required String hastag1,
    required String hastag2,
  }) async {
    try {
      String urlProduct = "${KeysEnpoint.product}?hastag1=$hastag1&hastag2=$hastag2";
      log(urlProduct, name: "data url Product");
      final response = await get(urlProduct);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelResponseProductWhereHastagMlFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  Future<ModelResponsePatchProduct> patchProducts(
      ModelRequestPatchProduct input) async {
    try {
      const String urlProduct = KeysEnpoint.product;
      log(urlProduct, name: "data url Product");
      final request = modelRequestPatchProductToJson(input);
      final response = await patch(
        urlProduct,
        request,
      );
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        // log(response.bodyString!, name: 'data response');
        return modelResponsePatchProductFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseURL;
    super.onInit();
  }
}
