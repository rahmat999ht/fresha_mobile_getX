// To parse this JSON data, do
//
//     final modelRequestPatchCustamer = modelRequestPatchCustamerFromJson(jsonString);

import 'dart:convert';

ModelRequestPatchCustamer modelRequestPatchCustamerFromJson(String str) => ModelRequestPatchCustamer.fromJson(json.decode(str));

String modelRequestPatchCustamerToJson(ModelRequestPatchCustamer data) => json.encode(data.toJson());

class ModelRequestPatchCustamer {
  String id;
  String name;
  String image;
  String address;
  String phone;

  ModelRequestPatchCustamer({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.phone,
  });

  factory ModelRequestPatchCustamer.fromJson(Map<String, dynamic> json) => ModelRequestPatchCustamer(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    address: json["address"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "address": address,
    "phone": phone,
  };
}
