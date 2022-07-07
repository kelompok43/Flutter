// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

UserDetail transactionFromJson(String str) => UserDetail.fromJson(json.decode(str));

String transactionToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
    UserDetail({
        required this.id,
        required this.usersId,
        required this.phone,
        required this.address,
        required this.gender,
        required this.dob,
    });

    int id;
    int usersId;
    String phone;
    String address;
    String gender;
    String dob;

    factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        usersId: json["users_id"],
        phone: json["phone"],
        address: json["address"],
        gender: json["gender"],
        dob: json["dob"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "phone": phone,
        "address": address,
        "gender": gender,
        "dob": dob,
    };
}
