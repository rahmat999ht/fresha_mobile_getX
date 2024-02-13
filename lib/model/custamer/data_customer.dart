
class Customer {
  String id;
  dynamic name;
  String email;
  dynamic phone;
  dynamic address;
  dynamic emailVerified;
  dynamic image;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.emailVerified,
    required this.image,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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