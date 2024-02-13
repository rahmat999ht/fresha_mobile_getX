
class DataProduct {
    String id;
    String image;
    String name;
    String hastagMl;
    String category;
    String desc;
    int price;
    int stock;

    DataProduct({
        required this.id,
        required this.image,
        required this.name,
        required this.hastagMl,
        required this.category,
        required this.desc,
        required this.price,
        required this.stock,
    });

    factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        hastagMl: json["hastag_ml"],
        category: json["category"],
        desc: json["desc"],
        price: json["price"],
        stock: json["stock"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "hastag_ml": hastagMl,
        "category": category,
        "desc": desc,
        "price": price,
        "stock": stock,
    };
}
