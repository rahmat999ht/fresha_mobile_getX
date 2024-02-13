class DataOrder {
  String id;
  String status;
  int totPrice;
  int amount;

  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  String orderById;

  DataOrder({
    required this.id,
    required this.status,
    required this.totPrice,
    required this.amount,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderById,
  });

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
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
