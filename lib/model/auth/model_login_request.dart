import 'dart:convert';

ModelLoginRequest modelLoginRequestFromJson(String str) =>
    ModelLoginRequest.fromJson(json.decode(str));

String modelLoginRequestToJson(ModelLoginRequest data) =>
    json.encode(data.toJson());

class ModelLoginRequest {
  String email;

  ModelLoginRequest({
    required this.email,
  });

  factory ModelLoginRequest.fromJson(Map<String, dynamic> json) =>
      ModelLoginRequest(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
