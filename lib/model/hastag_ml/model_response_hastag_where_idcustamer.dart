// To parse this JSON data, do
//
//     final modelResponseHastagMlWhereIdCustomer = modelResponseHastagMlWhereIdCustomerFromJson(jsonString);

import 'dart:convert';

ModelResponseHastagMlWhereIdCustomer modelResponseHastagMlWhereIdCustomerFromJson(String str) => ModelResponseHastagMlWhereIdCustomer.fromJson(json.decode(str));

String modelResponseHastagMlWhereIdCustomerToJson(ModelResponseHastagMlWhereIdCustomer data) => json.encode(data.toJson());

class ModelResponseHastagMlWhereIdCustomer {
  int code;
  String status;
  List<DataHastagWhereIdCustomer> data;

  ModelResponseHastagMlWhereIdCustomer({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponseHastagMlWhereIdCustomer.fromJson(Map<String, dynamic> json) => ModelResponseHastagMlWhereIdCustomer(
    code: json["code"],
    status: json["status"],
    data: List<DataHastagWhereIdCustomer>.from(json["data"].map((x) => DataHastagWhereIdCustomer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataHastagWhereIdCustomer {
  String id;
  String name;
  String custamerId;
  DateTime createdAt;
  DateTime updatedAt;

  DataHastagWhereIdCustomer({
    required this.id,
    required this.name,
    required this.custamerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataHastagWhereIdCustomer.fromJson(Map<String, dynamic> json) => DataHastagWhereIdCustomer(
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
