import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.addres,
    required this.gender,
    required this.membershipId,
  });

  int id;
  String name;
  String username;
  String password;
  String email;
  String phone;
  String addres;
  String gender;
  String membershipId;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        addres: json["addres"],
        gender: json["gender"],
        membershipId: json["membership_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "email": email,
        "phone": phone,
        "addres": addres,
        "gender": gender,
        "membership_id": membershipId,
      };
}
