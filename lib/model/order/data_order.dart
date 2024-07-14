class DataOrder {
  String id;
  String status;
  int totBuy;
  DateTime createdAt;
  DateTime updatedAt;
  String orderById;

  DataOrder({
    required this.id,
    required this.status,
    required this.totBuy,
    required this.createdAt,
    required this.updatedAt,
    required this.orderById,
  });

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        id: json["id"],
        status: json["status"],
        totBuy: json["totBuy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        orderById: json["orderById"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "totBuy": totBuy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "orderById": orderById,
      };
}
