import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
    int code;
    String status;
    Data data;

    ResponseLogin({
        required this.code,
        required this.status,
        required this.data,
    });

    factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
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
    dynamic name;
    String email;
    dynamic phone;
    dynamic address;
    dynamic emailVerified;
    dynamic image;

    Costumer({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.address,
        required this.emailVerified,
        required this.image,
    });

    factory Costumer.fromJson(Map<String, dynamic> json) => Costumer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        emailVerified: json["emailVerified"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "emailVerified": emailVerified,
        "image": image,
    };
}
