// To parse this JSON data, do
//
//     final trainers = trainersFromJson(jsonString);

import 'dart:convert';

Trainers trainersFromJson(String str) => Trainers.fromJson(json.decode(str));

String trainersToJson(Trainers data) => json.encode(data.toJson());

class Trainers {
  Trainers({
    required this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.gender,
    required this.phone,
    required this.address,
    required this.picture,
    required this.field,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String dob;
  String email;
  String gender;
  String phone;
  String address;
  String picture;
  String field;
  DateTime createdAt;
  DateTime updatedAt;

  factory Trainers.fromJson(Map<String, dynamic> json) => Trainers(
        id: json["id"],
        name: json["name"],
        dob: json["dob"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        address: json["address"],
        picture: json["picture"],
        field: json["field"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dob": dob,
        "email": email,
        "gender": gender,
        "phone": phone,
        "address": address,
        "picture": picture,
        "field": field,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
