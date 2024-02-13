import 'dart:convert';

ModelOrderById modelOrderByIdFromJson(String str) =>
    ModelOrderById.fromJson(json.decode(str));

String modelOrderByIdToJson(ModelOrderById dataOrderById) =>
    json.encode(dataOrderById.toJson());

class ModelOrderById {
  int code;
  String status;
  DataOrderById dataOrderById;

  ModelOrderById({
    required this.code,
    required this.status,
    required this.dataOrderById,
  });

  factory ModelOrderById.fromJson(Map<String, dynamic> json) => ModelOrderById(
        code: json["code"],
        status: json["status"],
        dataOrderById: DataOrderById.fromJson(json["dataOrderById"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "dataOrderById": dataOrderById.toJson(),
      };
}

class DataOrderById {
  String id;
  String status;
  int totPrice;
  int amount;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  String orderById;

  DataOrderById({
    required this.id,
    required this.status,
    required this.totPrice,
    required this.amount,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderById,
  });

  factory DataOrderById.fromJson(Map<String, dynamic> json) => DataOrderById(
        id: json["id"],
        status: json["status"],
        totPrice: json["totPrice"],
        amount: json["amount"],
        productId: json["productId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderById: json["orderById"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totPrice": totPrice,
        "amount": amount,
        "productId": productId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderById": orderById,
      };
}
