// To parse this JSON data, do
//
//     final modelResponseOrderId = modelResponseOrderIdFromJson(jsonString);

import 'dart:convert';

import 'package:fresha_mobile/core.dart';

ModelResponseOrderId modelResponseOrderIdFromJson(String str) =>
    ModelResponseOrderId.fromJson(json.decode(str));

String modelResponseOrderIdToJson(ModelResponseOrderId data) =>
    json.encode(data.toJson());

class ModelResponseOrderId {
  int code;
  String status;
  Data data;

  ModelResponseOrderId({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponseOrderId.fromJson(Map<String, dynamic> json) =>
      ModelResponseOrderId(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class DataUtama {
  String id;
  String status;
  int totBuy;
  String orderById;
  DateTime createdAt;
  DateTime updatedAt;
  List<ListProduct> listProduct;
  OrderBy orderBy;

  DataUtama({
    required this.id,
    required this.status,
    required this.totBuy,
    required this.orderById,
    required this.createdAt,
    required this.updatedAt,
    required this.listProduct,
    required this.orderBy,
  });

  factory DataUtama.fromJson(Map<String, dynamic> json) => DataUtama(
        id: json["id"],
        status: json["status"],
        totBuy: json["totBuy"],
        orderById: json["orderById"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        listProduct: List<ListProduct>.from(
            json["listProduct"].map((x) => ListProduct.fromJson(x))),
        orderBy: OrderBy.fromJson(json["orderBy"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totBuy": totBuy,
        "orderById": orderById,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "listProduct": List<dynamic>.from(listProduct.map((x) => x.toJson())),
        "orderBy": orderBy.toJson(),
      };
}

class ListProduct {
  String productId;
  String orderId;
  int quantity;
  int totPrice;
  DataProduct product;

  ListProduct({
    required this.productId,
    required this.orderId,
    required this.quantity,
    required this.totPrice,
    required this.product,
  });

  factory ListProduct.fromJson(Map<String, dynamic> json) => ListProduct(
        productId: json["productId"],
        orderId: json["orderId"],
        quantity: json["quantity"],
        totPrice: json["totPrice"],
        product: DataProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "orderId": orderId,
        "quantity": quantity,
        "totPrice": totPrice,
        "product": product.toJson(),
      };
}

class OrderBy {
  String id;
  String name;
  String image;
  String email;
  dynamic emailVerified;
  String phone;
  String address;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  OrderBy({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.address,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderBy.fromJson(Map<String, dynamic> json) => OrderBy(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        phone: json["phone"],
        address: json["address"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
        "emailVerified": emailVerified,
        "phone": phone,
        "address": address,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
