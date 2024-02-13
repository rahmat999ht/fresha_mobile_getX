// To parse this JSON data, do
//
//     final modelOrders = modelOrdersFromJson(jsonString);

import 'dart:convert';

import 'model.dart';

ModelOrders modelOrdersFromJson(String str) =>
    ModelOrders.fromJson(json.decode(str));

String modelOrdersToJson(ModelOrders data) => json.encode(data.toJson());

class ModelOrders {
  int code;
  String status;
  List<DataOrder> data;
  Meta meta;

  ModelOrders({
    required this.code,
    required this.status,
    required this.data,
    required this.meta,
  });

  factory ModelOrders.fromJson(Map<String, dynamic> json) => ModelOrders(
        code: json["code"],
        status: json["status"],
        data: List<DataOrder>.from(
            json["data"].map((x) => DataOrder.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class DataOrder {
  String id;
  String status;
  int totPrice;
  int amount;

  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  String orderById;

  DataOrder({
    required this.id,
    required this.status,
    required this.totPrice,
    required this.amount,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderById,
  });

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        id: json["id"],
        status: json["status"],
        totPrice: json["totPrice"],
        amount: json["amount"],
        productId: json["productId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderById: json["orderById"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totPrice": totPrice,
        "amount": amount,
        "productId": productId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderById": orderById,
      };
}
