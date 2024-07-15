import 'dart:convert';

DataCustomer dataCustomerFromJson(String str) =>
    DataCustomer.fromJson(json.decode(str));

class DataCustomer {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final DateTime? emailVerified;
  final String? image;

  DataCustomer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.emailVerified,
    required this.image,
  });

  factory DataCustomer.fromJson(Map<String, dynamic> json) => DataCustomer(
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


// {
//     "id": "clsj2lg840001m515mdskrnoy",
//     "name": "yayat",
//     "email": "rahmat999ht@gmail.com",
//     "phone": "vsdva",
//     "address": "sjdvjs",
//     "image": "ajkdkbs"
//   }