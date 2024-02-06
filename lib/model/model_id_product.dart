// To parse this JSON data, do
//
//     final modelIdProduct = modelIdProductFromJson(jsonString);

import 'dart:convert';

ModelIdProduct modelIdProductFromJson(String str) =>
    ModelIdProduct.fromJson(json.decode(str));

String modelIdProductToJson(ModelIdProduct data) => json.encode(data.toJson());

class ModelIdProduct {
  int code;
  String status;
  Data data;

  ModelIdProduct({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelIdProduct.fromJson(Map<String, dynamic> json) => ModelIdProduct(
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

class Data {
  String id;
  String image;
  String name;
  String hastagMl;
  String category;
  String desc;
  int price;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;
  String createdById;

  Data({
    required this.id,
    required this.image,
    required this.name,
    required this.hastagMl,
    required this.category,
    required this.desc,
    required this.price,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    required this.createdById,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        hastagMl: json["hastag_ml"],
        category: json["category"],
        desc: json["desc"],
        price: json["price"],
        stock: json["stock"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdById: json["createdById"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "hastag_ml": hastagMl,
        "category": category,
        "desc": desc,
        "price": price,
        "stock": stock,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdById": createdById,
      };
}
