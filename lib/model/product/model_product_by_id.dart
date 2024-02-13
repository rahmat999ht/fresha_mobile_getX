// To parse this JSON data, do
//
//     final modelProductById = modelProductByIdFromJson(jsonString);

import 'dart:convert';

import '../../core.dart';

ModelProductById modelProductByIdFromJson(String str) =>
    ModelProductById.fromJson(json.decode(str));

String modelProductByIdToJson(ModelProductById data) => json.encode(data.toJson());

class ModelProductById {
  int code;
  String status;
  DataProduct data;

  ModelProductById({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelProductById.fromJson(Map<String, dynamic> json) => ModelProductById(
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
