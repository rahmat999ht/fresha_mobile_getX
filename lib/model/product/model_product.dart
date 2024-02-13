// To parse this JSON data, do
//
//     final modelProduct = modelProductFromJson(jsonString);

import 'dart:convert';

ModelProduct modelProductFromJson(String str) => ModelProduct.fromJson(json.decode(str));

String modelProductToJson(ModelProduct data) => json.encode(data.toJson());

class ModelProduct {
    int code;
    String status;
    List<DataProduct> data;
    MetaProduct meta;

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
        meta: MetaProduct.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class DataProduct {
    String id;
    String image;
    String name;
    String hastagMl;
    String category;
    String desc;
    int price;
    int stock;

    DataProduct({
        required this.id,
        required this.image,
        required this.name,
        required this.hastagMl,
        required this.category,
        required this.desc,
        required this.price,
        required this.stock,
    });

    factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        hastagMl: json["hastag_ml"],
        category: json["category"],
        desc: json["desc"],
        price: json["price"],
        stock: json["stock"],
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
    };
}

class MetaProduct {
    int perPage;
    int currentPage;
    int lastPage;
    int total;
    dynamic prev;
    dynamic next;

    MetaProduct({
        required this.perPage,
        required this.currentPage,
        required this.lastPage,
        required this.total,
        required this.prev,
        required this.next,
    });

    factory MetaProduct.fromJson(Map<String, dynamic> json) => MetaProduct(
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
        total: json["total"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "perPage": perPage,
        "currentPage": currentPage,
        "lastPage": lastPage,
        "total": total,
        "prev": prev,
        "next": next,
    };
}
