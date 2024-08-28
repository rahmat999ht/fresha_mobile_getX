// To parse this JSON data, do
//
//     final modelResponsePostOrder = modelResponsePostOrderFromJson(jsonString);

import 'dart:convert';

ModelResponsePostOrder modelResponsePostOrderFromJson(String str) => ModelResponsePostOrder.fromJson(json.decode(str));

String modelResponsePostOrderToJson(ModelResponsePostOrder data) => json.encode(data.toJson());

class ModelResponsePostOrder {
    final int code;
    final String status;
    final DataResponsePostOrder data;

    ModelResponsePostOrder({
        required this.code,
        required this.status,
        required this.data,
    });

    ModelResponsePostOrder copyWith({
        int? code,
        String? status,
        DataResponsePostOrder? data,
    }) => 
        ModelResponsePostOrder(
            code: code ?? this.code,
            status: status ?? this.status,
            data: data ?? this.data,
        );

    factory ModelResponsePostOrder.fromJson(Map<String, dynamic> json) => ModelResponsePostOrder(
        code: json["code"],
        status: json["status"],
        data: DataResponsePostOrder.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
    };
}

class DataResponsePostOrder {
    final String id;
    final String status;
    final int totBuy;
    final String orderById;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<ListProduct> listProduct;

    DataResponsePostOrder({
        required this.id,
        required this.status,
        required this.totBuy,
        required this.orderById,
        required this.createdAt,
        required this.updatedAt,
        required this.listProduct,
    });

    DataResponsePostOrder copyWith({
        String? id,
        String? status,
        int? totBuy,
        String? orderById,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<ListProduct>? listProduct,
    }) => 
        DataResponsePostOrder(
            id: id ?? this.id,
            status: status ?? this.status,
            totBuy: totBuy ?? this.totBuy,
            orderById: orderById ?? this.orderById,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            listProduct: listProduct ?? this.listProduct,
        );

    factory DataResponsePostOrder.fromJson(Map<String, dynamic> json) => DataResponsePostOrder(
        id: json["id"],
        status: json["status"],
        totBuy: json["totBuy"],
        orderById: json["orderById"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        listProduct: List<ListProduct>.from(json["listProduct"].map((x) => ListProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totBuy": totBuy,
        "orderById": orderById,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "listProduct": List<dynamic>.from(listProduct.map((x) => x.toJson())),
    };
}

class ListProduct {
    final String productId;
    final String orderId;
    final int quantity;
    final int totPrice;

    ListProduct({
        required this.productId,
        required this.orderId,
        required this.quantity,
        required this.totPrice,
    });

    ListProduct copyWith({
        String? productId,
        String? orderId,
        int? quantity,
        int? totPrice,
    }) => 
        ListProduct(
            productId: productId ?? this.productId,
            orderId: orderId ?? this.orderId,
            quantity: quantity ?? this.quantity,
            totPrice: totPrice ?? this.totPrice,
        );

    factory ListProduct.fromJson(Map<String, dynamic> json) => ListProduct(
        productId: json["productId"],
        orderId: json["orderId"],
        quantity: json["quantity"],
        totPrice: json["totPrice"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "orderId": orderId,
        "quantity": quantity,
        "totPrice": totPrice,
    };
}
