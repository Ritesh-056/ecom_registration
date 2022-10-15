// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

// import 'dart:convert';
//
// Company companyFromJson(String str) => Company.fromJson(json.decode(str));
//
// String companyToJson(Company data) => json.encode(data.toJson());
//
// class Company {
//   Company({
//     this.id,
//     this.files,
//     this.approved,
//     required this.name,
//     required this.email,
//     required this.telephone,
//     required this.fax,
//     required this.fieldOfBusiness,
//     required this.state,
//     required this.district,
//     required this.municipality,
//     required this.postalCode,
//     required this.wardNo,
//   });
//
//   bool? approved;
//   int? id;
//   String name;
//   String email;
//   String telephone;
//   String fax;
//   String fieldOfBusiness;
//   String state;
//   String district;
//   String municipality;
//   String postalCode;
//   String wardNo;
//   List<dynamic>? files;
//
//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//     approved: json["approved"],
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     telephone: json["telephone"],
//     fax: json["fax"],
//     fieldOfBusiness: json["fieldOfBusiness"],
//     state: json["state"],
//     district: json["district"],
//     municipality: json["municipality"],
//     postalCode: json["postalCode"],
//     wardNo: json["wardNo"],
//     files: List<dynamic>.from(json["files"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "approved": approved,
//     "id": id,
//     "name": name,
//     "email": email,
//     "telephone": telephone,
//     "fax": fax,
//     "fieldOfBusiness": fieldOfBusiness,
//     "state": state,
//     "district": district,
//     "municipality": municipality,
//     "postalCode": postalCode,
//     "wardNo": wardNo,
//     "files": List<dynamic>.from(files!.map((x) => x)),
//   };
// }

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
  List<FileElement>? files;
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
    files: List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
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
    "files": List<dynamic>.from(files!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class FileElement {
  FileElement({
   required this.type,
   required this.data,
  });

  String type;
  List<int> data;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    type: json["type"],
    data: List<int>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
