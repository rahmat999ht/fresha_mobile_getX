import 'dart:convert';

import 'list_product_custamer.dart';

ModelResponseOrderByCustamer modelResponseOrderByCustamerFromJson(String str) =>
    ModelResponseOrderByCustamer.fromJson(json.decode(str));

String modelResponseOrderByCustamerToJson(ModelResponseOrderByCustamer data) =>
    json.encode(data.toJson());

class ModelResponseOrderByCustamer {
  int code;
  String status;
  List<DataOrderByCustamer> data;

  ModelResponseOrderByCustamer({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponseOrderByCustamer.fromJson(Map<String, dynamic> json) =>
      ModelResponseOrderByCustamer(
        code: json["code"],
        status: json["status"],
        data: List<DataOrderByCustamer>.from(
            json["data"].map((x) => DataOrderByCustamer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataOrderByCustamer {
  String id;
  String status;
  int totBuy;
  DateTime createdAt;
  DateTime updatedAt;
  String orderById;
  List<ListProductCustamer> listProduct;

  DataOrderByCustamer({
    required this.id,
    required this.status,
    required this.totBuy,
    required this.createdAt,
    required this.updatedAt,
    required this.orderById,
    required this.listProduct,
  });

  factory DataOrderByCustamer.fromJson(Map<String, dynamic> json) =>
      DataOrderByCustamer(
        id: json["id"],
        status: json["status"],
        totBuy: json["totBuy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderById: json["orderById"],
        listProduct: List<ListProductCustamer>.from(
            json["listProduct"].map((x) => ListProductCustamer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totBuy": totBuy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderById": orderById,
        "listProduct": List<dynamic>.from(listProduct.map((x) => x.toJson())),
      };
}

// class Product {
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

//   Product({
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

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
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
