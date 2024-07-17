// To parse this JSON data, do
//
//     final modelResponsePatchProduct = modelResponsePatchProductFromJson(jsonString);

import 'dart:convert';

import 'package:fresha_mobile/core.dart';

ModelResponsePatchProduct modelResponsePatchProductFromJson(String str) => ModelResponsePatchProduct.fromJson(json.decode(str));

String modelResponsePatchProductToJson(ModelResponsePatchProduct data) => json.encode(data.toJson());

class ModelResponsePatchProduct {
  int code;
  String status;
  DataProduct data;

  ModelResponsePatchProduct({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponsePatchProduct.fromJson(Map<String, dynamic> json) => ModelResponsePatchProduct(
    code: json["code"],
    status: json["status"],
    data: DataProduct.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data.toJson(),
  };
}
