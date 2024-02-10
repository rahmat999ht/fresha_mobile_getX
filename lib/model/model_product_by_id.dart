// To parse this JSON data, do
//
//     final modelProductById = modelProductByIdFromJson(jsonString);

import 'dart:convert';

import '../core.dart';

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

// class DataProduct {
//   String id;
//   String image;
//   String name;
//   String hastagMl;
//   String category;
//   String desc;
//   int price;
//   int stock;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdById;

//   DataProduct({
//     required this.id,
//     required this.image,
//     required this.name,
//     required this.hastagMl,
//     required this.category,
//     required this.desc,
//     required this.price,
//     required this.stock,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdById,
//   });

//   factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
//         id: json["id"],
//         image: json["image"],
//         name: json["name"],
//         hastagMl: json["hastag_ml"],
//         category: json["category"],
//         desc: json["desc"],
//         price: json["price"],
//         stock: json["stock"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdById: json["createdById"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "name": name,
//         "hastag_ml": hastagMl,
//         "category": category,
//         "desc": desc,
//         "price": price,
//         "stock": stock,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdById": createdById,
//       };
// }
