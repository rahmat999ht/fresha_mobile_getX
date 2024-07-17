// To parse this JSON data, do
//
//     final modelRequestPatchProduct = modelRequestPatchProductFromJson(jsonString);

import 'dart:convert';

ModelRequestPatchProduct modelRequestPatchProductFromJson(String str) => ModelRequestPatchProduct.fromJson(json.decode(str));

String modelRequestPatchProductToJson(ModelRequestPatchProduct data) => json.encode(data.toJson());

class ModelRequestPatchProduct {
  String id;
  int stock;

  ModelRequestPatchProduct({
    required this.id,
    required this.stock,
  });

  factory ModelRequestPatchProduct.fromJson(Map<String, dynamic> json) => ModelRequestPatchProduct(
    id: json["id"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stock": stock,
  };
}
