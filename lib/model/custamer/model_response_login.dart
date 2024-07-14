// To parse this JSON data, do
//
//     final modelResponseLogin = modelResponseLoginFromJson(jsonString);

import 'dart:convert';

ModelResponseLogin modelResponseLoginFromJson(String str) =>
    ModelResponseLogin.fromJson(json.decode(str));

String modelResponseLoginToJson(ModelResponseLogin data) =>
    json.encode(data.toJson());

class ModelResponseLogin {
  int code;
  String status;
  Data data;

  ModelResponseLogin({
    required this.code,
    required this.status,
    required this.data,
  });

  factory ModelResponseLogin.fromJson(Map<String, dynamic> json) =>
      ModelResponseLogin(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Costumer costumer;
  String token;

  Data({
    required this.costumer,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        costumer: Costumer.fromJson(json["costumer"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "costumer": costumer.toJson(),
        "token": token,
      };
}

class Costumer {
  String id;
  String name;
  dynamic image;
  String email;
  dynamic emailVerified;
  dynamic phone;
  dynamic address;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Costumer({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.address,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Costumer.fromJson(Map<String, dynamic> json) => Costumer(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        phone: json["phone"],
        address: json["address"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
        "emailVerified": emailVerified,
        "phone": phone,
        "address": address,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
