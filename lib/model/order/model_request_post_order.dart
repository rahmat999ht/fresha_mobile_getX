// To parse this JSON data, do
//
//     final formOrderPost = formOrderPostFromJson(jsonString);

import 'dart:convert';

ModelRequestOrderPost formOrderPostFromJson(String str) =>
    ModelRequestOrderPost.fromJson(json.decode(str));

String formOrderPostToJson(ModelRequestOrderPost data) => json.encode(data.toJson());

class ModelRequestOrderPost {
  String status;
  int totBuy;
  String orderById;
  List<ListProductOrder> listProduct;

  ModelRequestOrderPost({
    required this.status,
    required this.totBuy,
    required this.orderById,
    required this.listProduct,
  });

  factory ModelRequestOrderPost.fromJson(Map<String, dynamic> json) => ModelRequestOrderPost(
        status: json["status"],
        totBuy: json["totBuy"],
        orderById: json["orderById"],
        listProduct: List<ListProductOrder>.from(
            json["listProduct"].map((x) => ListProductOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totBuy": totBuy,
        "orderById": orderById,
        "listProduct": List<dynamic>.from(listProduct.map((x) => x.toJson())),
      };
}

class ListProductOrder {
  String productId;
  int quantity;
  int totPrice;

  ListProductOrder({
    required this.productId,
    required this.quantity,
    required this.totPrice,
  });

  factory ListProductOrder.fromJson(Map<String, dynamic> json) =>
      ListProductOrder(
        productId: json["productId"],
        quantity: json["quantity"],
        totPrice: json["totPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "totPrice": totPrice,
      };
}
