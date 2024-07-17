
import '../product/data_product.dart';

class ListProductCustamer {
  String productId;
  String orderId;
  int quantity;
  int totPrice;
  DataProduct product;

  ListProductCustamer({
    required this.productId,
    required this.orderId,
    required this.quantity,
    required this.totPrice,
    required this.product,
  });

  factory ListProductCustamer.fromJson(Map<String, dynamic> json) =>
      ListProductCustamer(
        productId: json["productId"],
        orderId: json["orderId"],
        quantity: json["quantity"],
        totPrice: json["totPrice"],
        product: DataProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "orderId": orderId,
    "quantity": quantity,
    "totPrice": totPrice,
    "product": product.toJson(),
  };
}
