// To parse this JSON data, do
//
//     final modelResponseProductWhereHastagMl = modelResponseProductWhereHastagMlFromJson(jsonString);

import 'dart:convert';

import 'package:fresha_mobile/core.dart';

ModelResponseProductWhereHastagMl modelResponseProductWhereHastagMlFromJson(String str) => ModelResponseProductWhereHastagMl.fromJson(json.decode(str));

String modelResponseProductWhereHastagMlToJson(ModelResponseProductWhereHastagMl data) => json.encode(data.toJson());

class ModelResponseProductWhereHastagMl {
  int code;
  String status;
  List<DataProduct> data;

  ModelResponseProductWhereHastagMl({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponseProductWhereHastagMl.fromJson(Map<String, dynamic> json) => ModelResponseProductWhereHastagMl(
    code: json["code"],
    status: json["status"],
    data: List<DataProduct>.from(json["data"].map((x) => DataProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
