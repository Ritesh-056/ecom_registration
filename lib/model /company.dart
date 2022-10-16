// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.fax,
    required this.fieldOfBusiness,
    required this.state,
    required this.district,
    required this.municipality,
    required this.postalCode,
    required this.wardNo,
    this.approved,
    this.files,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String name;
  String email;
  String telephone;
  String fax;
  String fieldOfBusiness;
  String state;
  String district;
  String municipality;
  String postalCode;
  String wardNo;
  bool? approved;
  List<String>? files;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    telephone: json["telephone"],
    fax: json["fax"],
    fieldOfBusiness: json["fieldOfBusiness"],
    state: json["state"],
    district: json["district"],
    municipality: json["municipality"],
    postalCode: json["postalCode"],
    wardNo: json["wardNo"],
    approved: json["approved"],
    files: List<String>.from(json["files"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "telephone": telephone,
    "fax": fax,
    "fieldOfBusiness": fieldOfBusiness,
    "state": state,
    "district": district,
    "municipality": municipality,
    "postalCode": postalCode,
    "wardNo": wardNo,
    "approved": approved,
    "files": List<dynamic>.from(files!.map((x) => x)),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
