// To parse this JSON data, do
//
//     final modelResponsePatchCustamer = modelResponsePatchCustamerFromJson(jsonString);

import 'dart:convert';

import '../../core.dart';

ModelResponsePatchCustamer modelResponsePatchCustamerFromJson(String str) => ModelResponsePatchCustamer.fromJson(json.decode(str));

String modelResponsePatchCustamerToJson(ModelResponsePatchCustamer data) => json.encode(data.toJson());

class ModelResponsePatchCustamer {
  int code;
  String status;
  DataCustomer data;

  ModelResponsePatchCustamer({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponsePatchCustamer.fromJson(Map<String, dynamic> json) => ModelResponsePatchCustamer(
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
