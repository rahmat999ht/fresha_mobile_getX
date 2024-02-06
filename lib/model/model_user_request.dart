import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserRequest {
  final String email;
  final String name;
  final String image;
  UserRequest({
    required this.email,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'image': image,
    };
  }

  factory UserRequest.fromMap(Map<String, dynamic> map) {
    return UserRequest(
      email: map['email'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRequest.fromJson(String source) => UserRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
