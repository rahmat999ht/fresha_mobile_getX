// To parse this JSON data, do
//
//     final modelCustomer = modelCustomerFromJson(jsonString);

import 'dart:convert';

import 'package:fresha_mobile/model/model.dart';


ModelCustomer modelCustomerFromJson(String str) => ModelCustomer.fromJson(json.decode(str));

String modelCustomerToJson(ModelCustomer data) => json.encode(data.toJson());

class ModelCustomer {
    int code;
    String status;
    List<DataCustomer> data;
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
        data: List<DataCustomer>.from(json["data"].map((x) => DataCustomer.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}
