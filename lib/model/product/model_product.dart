// To parse this JSON data, do
//
//     final modelProduct = modelProductFromJson(jsonString);

import 'dart:convert';

import '../model.dart';

ModelProduct modelProductFromJson(String str) => ModelProduct.fromJson(json.decode(str));

String modelProductToJson(ModelProduct data) => json.encode(data.toJson());

class ModelProduct {
    int code;
    String status;
    List<DataProduct> data;
    Meta meta;

    ModelProduct({
        required this.code,
        required this.status,
        required this.data,
        required this.meta,
    });

    factory ModelProduct.fromJson(Map<String, dynamic> json) => ModelProduct(
        code: json["code"],
        status: json["status"],
        data: List<DataProduct>.from(json["data"].map((x) => DataProduct.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}
