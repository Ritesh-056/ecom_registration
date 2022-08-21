// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.id,
    this.files,
    required this.approved,
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
  });

  bool approved;
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
  List<dynamic>? files;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    approved: json["approved"],
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
    files: List<dynamic>.from(json["files"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "approved": approved,
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
    "files": List<dynamic>.from(files!.map((x) => x)),
  };
}
