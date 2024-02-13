import 'dart:convert';

UserResponseError userResponseErrorFromJson(String str) => UserResponseError.fromJson(json.decode(str));

String userResponseErrorToJson(UserResponseError data) => json.encode(data.toJson());

class UserResponseError {
    int code;
    List<String> errors;

    UserResponseError({
        required this.code,
        required this.errors,
    });

    factory UserResponseError.fromJson(Map<String, dynamic> json) => UserResponseError(
        code: json["code"],
        errors: List<String>.from(json["errors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "errors": List<dynamic>.from(errors.map((x) => x)),
    };
}
