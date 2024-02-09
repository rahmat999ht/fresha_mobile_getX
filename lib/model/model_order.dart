// To parse this JSON data, do
//
//     final modelOrders = modelOrdersFromJson(jsonString);

import 'dart:convert';

ModelOrders modelOrdersFromJson(String str) => ModelOrders.fromJson(json.decode(str));

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
        data: List<DataOrder>.from(json["data"].map((x) => DataOrder.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class DataOrder {
    String id;
    String status;
    int totPrice;
    String productId;
    DateTime createdAt;
    DateTime updatedAt;
    String orderById;

    DataOrder({
        required this.id,
        required this.status,
        required this.totPrice,
        required this.productId,
        required this.createdAt,
        required this.updatedAt,
        required this.orderById,
    });

    factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        id: json["id"],
        status: json["status"],
        totPrice: json["totPrice"],
        productId: json["productId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderById: json["orderById"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totPrice": totPrice,
        "productId": productId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderById": orderById,
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
