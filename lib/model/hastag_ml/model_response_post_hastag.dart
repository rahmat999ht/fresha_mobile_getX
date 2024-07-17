// To parse this JSON data, do
//
//     final modelResponsePostHastagMl = modelResponsePostHastagMlFromJson(jsonString);

import 'dart:convert';

ModelResponsePostHastagMl modelResponsePostHastagMlFromJson(String str) => ModelResponsePostHastagMl.fromJson(json.decode(str));

String modelResponsePostHastagMlToJson(ModelResponsePostHastagMl data) => json.encode(data.toJson());

class ModelResponsePostHastagMl {
  int code;
  String status;
  DataHastagMl data;

  ModelResponsePostHastagMl({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponsePostHastagMl.fromJson(Map<String, dynamic> json) => ModelResponsePostHastagMl(
    code: json["code"],
    status: json["status"],
    data: DataHastagMl.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data.toJson(),
  };
}

class DataHastagMl {
  String id;
  String name;
  String custamerId;
  DateTime createdAt;
  DateTime updatedAt;

  DataHastagMl({
    required this.id,
    required this.name,
    required this.custamerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataHastagMl.fromJson(Map<String, dynamic> json) => DataHastagMl(
    id: json["id"],
    name: json["name"],
    custamerId: json["custamerId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "custamerId": custamerId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
