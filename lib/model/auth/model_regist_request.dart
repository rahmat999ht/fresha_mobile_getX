import 'dart:convert';

ModelRegisterRequest modelRegisterRequestFromJson(String str) =>
    ModelRegisterRequest.fromJson(json.decode(str));

String modelRegisterRequestToJson(ModelRegisterRequest data) =>
    json.encode(data.toJson());

class ModelRegisterRequest {
  String name;
  String email;

  ModelRegisterRequest({
    required this.name,
    required this.email,
  });

  factory ModelRegisterRequest.fromJson(Map<String, dynamic> json) =>
      ModelRegisterRequest(
        name: json['name'],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
