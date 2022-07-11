class LoginResponse {
  LoginResponse({
    required this.data,
    required this.message,
    required this.rescode,
    required this.token,
  });

  final UserResponse? data;
  final String? message;
  final int? rescode;
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: json["data"] == null ? null : UserResponse.fromJson(json["data"]),
      message: json["message"],
      rescode: json["rescode"],
      token: json["token"],
    );
  }
}

class UserResponse {
  UserResponse({
    required this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.phone,
    required this.address,
    required this.gender,
    required this.status,
    required this.picture,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? dob;
  final String? email;
  final String? phone;
  final String? address;
  final String? gender;
  final String? status;
  final String? picture;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json["id"],
      name: json["name"],
      dob: json["dob"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      gender: json["gender"],
      status: json["status"],
      picture: json["picture"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
    );
  }
}
