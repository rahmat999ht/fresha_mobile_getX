import 'dart:convert';

ModelOrderById modelOrderByIdFromJson(String str) => ModelOrderById.fromJson(json.decode(str));

String modelOrderByIdToJson(ModelOrderById data) => json.encode(data.toJson());

class ModelOrderById {
    int code;
    String status;
    Data data;

    ModelOrderById({
        required this.code,
        required this.status,
        required this.data,
    });

    factory ModelOrderById.fromJson(Map<String, dynamic> json) => ModelOrderById(
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
    String id;
    String status;
    int totPrice;
    String productId;
    DateTime createdAt;
    DateTime updatedAt;
    String orderById;

    Data({
        required this.id,
        required this.status,
        required this.totPrice,
        required this.productId,
        required this.createdAt,
        required this.updatedAt,
        required this.orderById,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        status: json["status"],
        totPrice: json["totPrice"],
        productId: json["productId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderById: json["orderById"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totPrice": totPrice,
        "productId": productId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderById": orderById,
    };
}
