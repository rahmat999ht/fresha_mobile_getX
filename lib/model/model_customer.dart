import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelCustomer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final DateTime emailVerified;
  final String image;
  ModelCustomer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerified,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'emailVerified': emailVerified.millisecondsSinceEpoch,
      'image': image,
    };
  }

  factory ModelCustomer.fromMap(Map<String, dynamic> map) {
    return ModelCustomer(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      emailVerified: DateTime.fromMillisecondsSinceEpoch(map['emailVerified'] as int),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelCustomer.fromJson(String source) => ModelCustomer.fromMap(json.decode(source) as Map<String, dynamic>);
}