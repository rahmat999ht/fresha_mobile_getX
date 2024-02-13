// To parse this JSON data, do
//
//     final modelOrders = modelOrdersFromJson(jsonString);

import 'dart:convert';

import '../model.dart';

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

