// To parse this JSON data, do
//
//     final modelCustomer = modelCustomerFromJson(jsonString);

import 'dart:convert';

import 'model.dart';

ModelCustomer modelCustomerFromJson(String str) => ModelCustomer.fromJson(json.decode(str));

String modelCustomerToJson(ModelCustomer data) => json.encode(data.toJson());

class ModelCustomer {
    int code;
    String status;
    List<Customer> data;
    Meta meta;

    ModelCustomer({
        required this.code,
        required this.status,
        required this.data,
        required this.meta,
    });

    factory ModelCustomer.fromJson(Map<String, dynamic> json) => ModelCustomer(
        code: json["code"],
        status: json["status"],
        data: List<Customer>.from(json["data"].map((x) => Customer.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
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
