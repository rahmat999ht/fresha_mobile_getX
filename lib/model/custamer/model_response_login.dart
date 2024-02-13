import 'dart:convert';

import '../../core.dart';

ModelResponseLogin modelResponseLoginFromJson(String str) =>
    ModelResponseLogin.fromJson(json.decode(str));

String modelResponseLoginToJson(ModelResponseLogin data) =>
    json.encode(data.toJson());

class ModelResponseLogin {
  int code;
  String status;
  DataResponseLogin data;

  ModelResponseLogin({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponseLogin.fromJson(Map<String, dynamic> json) =>
      ModelResponseLogin(
        code: json["code"],
        status: json["status"],
        data: DataResponseLogin.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class DataResponseLogin {
  DataCustomer customer;
  String token;

  DataResponseLogin({
    required this.customer,
    required this.token,
  });

  factory DataResponseLogin.fromJson(Map<String, dynamic> json) =>
      DataResponseLogin(
        customer: DataCustomer.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": customer.toJson(),
        "token": token,
      };
}
