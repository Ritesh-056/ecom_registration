import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.email,
    required this.password,
    this.name,
  });

  String email;
  String password;
  String? name;

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    password: json["password"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
  };
}
