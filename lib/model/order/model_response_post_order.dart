// To parse this JSON data, do
//
//     final modelResponsePostOrder = modelResponsePostOrderFromJson(jsonString);

import 'dart:convert';

ModelResponsePostOrder modelResponsePostOrderFromJson(String str) => ModelResponsePostOrder.fromJson(json.decode(str));

String modelResponsePostOrderToJson(ModelResponsePostOrder data) => json.encode(data.toJson());

class ModelResponsePostOrder {
  int code;
  String status;
  DataResponsePostOrder data;

  ModelResponsePostOrder({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponsePostOrder.fromJson(Map<String, dynamic> json) => ModelResponsePostOrder(
    code: json["code"],
    status: json["status"],
    data: DataResponsePostOrder.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data.toJson(),
  };
}

class DataResponsePostOrder {
  String id;
  String status;
  int totBuy;
  String orderById;
  DateTime createdAt;
  DateTime updatedAt;
  List<ListProductPostOrder> listProduct;

  DataResponsePostOrder({
    required this.id,
    required this.status,
    required this.totBuy,
    required this.orderById,
    required this.createdAt,
    required this.updatedAt,
    required this.listProduct,
  });

  factory DataResponsePostOrder.fromJson(Map<String, dynamic> json) => DataResponsePostOrder(
    id: json["id"],
    status: json["status"],
    totBuy: json["totBuy"],
    orderById: json["orderById"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    listProduct: List<ListProductPostOrder>.from(json["listProduct"].map((x) => ListProductPostOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "totBuy": totBuy,
    "orderById": orderById,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "listProduct": List<dynamic>.from(listProduct.map((x) => x.toJson())),
  };
}

class ListProductPostOrder {
  String productId;
  String orderId;
  int quantity;
  int totPrice;

  ListProductPostOrder({
    required this.productId,
    required this.orderId,
    required this.quantity,
    required this.totPrice,
  });

  factory ListProductPostOrder.fromJson(Map<String, dynamic> json) => ListProductPostOrder(
    productId: json["productId"],
    orderId: json["orderId"],
    quantity: json["quantity"],
    totPrice: json["totPrice"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "orderId": orderId,
    "quantity": quantity,
    "totPrice": totPrice,
  };
}
