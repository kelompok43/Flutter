// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    required this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.phone,
    required this.address,
    required this.gender,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String dob;
  String email;
  String phone;
  String address;
  String gender;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        name: json["name"],
        dob: json["dob"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        gender: json["gender"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dob": dob,
        "email": email,
        "phone": phone,
        "address": address,
        "gender": gender,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
