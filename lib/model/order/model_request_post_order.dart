// To parse this JSON data, do
//
//     final modelRequestPostOrder = modelRequestPostOrderFromJson(jsonString);

import 'dart:convert';

ModelRequestPostOrder modelRequestPostOrderFromJson(String str) => ModelRequestPostOrder.fromJson(json.decode(str));

String modelRequestPostOrderToJson(ModelRequestPostOrder data) => json.encode(data.toJson());

class ModelRequestPostOrder {
  String status;
  int totBuy;
  String orderById;
  List<ProductPostOrder> listProduct;

  ModelRequestPostOrder({
    required this.status,
    required this.totBuy,
    required this.orderById,
    required this.listProduct,
  });

  factory ModelRequestPostOrder.fromJson(Map<String, dynamic> json) => ModelRequestPostOrder(
    status: json["status"],
    totBuy: json["totBuy"],
    orderById: json["orderById"],
    listProduct: List<ProductPostOrder>.from(json["listProduct"].map((x) => ProductPostOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totBuy": totBuy,
    "orderById": orderById,
    "listProduct": List<dynamic>.from(listProduct.map((x) => x.toJson())),
  };
}

class ProductPostOrder {
  String productId;
  int quantity;
  int totPrice;

  ProductPostOrder({
    required this.productId,
    required this.quantity,
    required this.totPrice,
  });

  factory ProductPostOrder.fromJson(Map<String, dynamic> json) => ProductPostOrder(
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
