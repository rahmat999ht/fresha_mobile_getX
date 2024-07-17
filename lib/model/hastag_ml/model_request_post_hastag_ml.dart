// To parse this JSON data, do
//
//     final modelRequestPostHastagMl = modelRequestPostHastagMlFromJson(jsonString);

import 'dart:convert';

ModelRequestPostHastagMl modelRequestPostHastagMlFromJson(String str) => ModelRequestPostHastagMl.fromJson(json.decode(str));

String modelRequestPostHastagMlToJson(ModelRequestPostHastagMl data) => json.encode(data.toJson());

class ModelRequestPostHastagMl {
  String name;
  String custamerId;

  ModelRequestPostHastagMl({
    required this.name,
    required this.custamerId,
  });

  factory ModelRequestPostHastagMl.fromJson(Map<String, dynamic> json) => ModelRequestPostHastagMl(
    name: json["name"],
    custamerId: json["custamerId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "custamerId": custamerId,
  };
}
