// To parse this JSON data, do
//
//     final modelResponseRegister = modelResponseRegisterFromJson(jsonString);

import 'dart:convert';

import '../core.dart';

ModelResponseRegister modelResponseRegisterFromJson(String str) => ModelResponseRegister.fromJson(json.decode(str));

String modelResponseRegisterToJson(ModelResponseRegister data) => json.encode(data.toJson());

class ModelResponseRegister {
    int code;
    String status;
    Customer data;

    ModelResponseRegister({
        required this.code,
        required this.status,
        required this.data,
    });

    factory ModelResponseRegister.fromJson(Map<String, dynamic> json) => ModelResponseRegister(
        code: json["code"],
        status: json["status"],
        data: Customer.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
    };
}
