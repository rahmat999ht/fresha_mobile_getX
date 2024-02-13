import 'dart:convert';

ModelUserRequest modelUserRequestFromJson(String str) => ModelUserRequest.fromJson(json.decode(str));

String modelUserRequestToJson(ModelUserRequest data) => json.encode(data.toJson());

class ModelUserRequest {
    String email;

    ModelUserRequest({
        required this.email,
    });

    factory ModelUserRequest.fromJson(Map<String, dynamic> json) => ModelUserRequest(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
