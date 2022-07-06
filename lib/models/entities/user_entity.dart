class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.phone,
    required this.address,
    required this.gender,
    required this.status,
  });

  final int id;
  final String? name;
  final String? dob;
  final String? email;
  final String? phone;
  final String? address;
  final String? gender;
  final String? status;
}
