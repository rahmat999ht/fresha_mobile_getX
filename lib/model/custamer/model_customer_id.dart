// To parse this JSON data, do
//
//     final modelIdCustomer = modelIdCustomerFromJson(jsonString);

import 'dart:convert';

import '../../core.dart';

ModelIdCustomer modelIdCustomerFromJson(String str) => ModelIdCustomer.fromJson(json.decode(str));

String modelIdCustomerToJson(ModelIdCustomer data) => json.encode(data.toJson());

class ModelIdCustomer {
    int code;
    String status;
    DataCustomer data;

    ModelIdCustomer({
        required this.code,
        required this.status,
        required this.data,
    });

    factory ModelIdCustomer.fromJson(Map<String, dynamic> json) => ModelIdCustomer(
        code: json["code"],
        status: json["status"],
        data: DataCustomer.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
    };
}
