import 'dart:convert';

ModelProduct modelProductFromJson(String str) =>
    ModelProduct.fromJson(json.decode(str));

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
        // data: List<DataProduct>.from(json["data"].map((x) => DataProduct.fromJson(x))),
        data: json["data"] == null
            ? <DataProduct>[]
            : List.from(json['data'])
                .map((v) => DataProduct.fromJson(v))
                .toList(),
        meta: Meta.fromJson(json["meta"]),
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
  // DateTime createdAt;
  // DateTime updatedAt;
  // String createdById;

  DataProduct({
    required this.id,
    required this.image,
    required this.name,
    required this.hastagMl,
    required this.category,
    required this.desc,
    required this.price,
    required this.stock,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.createdById,
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
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // createdById: json["createdById"],
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
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        // "createdById": createdById,
      };
}

class Meta {
  int perPage;
  int currentPage;
  int lastPage;
  int total;
  dynamic prev;
  dynamic next;

  Meta({
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.total,
    required this.prev,
    required this.next,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
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
