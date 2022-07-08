import 'package:fitness_gym/models/responses/login_response.dart';

import '../entities/user_entity.dart';
import 'base_preferences.dart';

class UserPreferences {
  final _id = "id";
  final _name = "name";
  final _email = "email";
  final _dob = "dob";
  final _phone = "phone";
  final _gender = "gender";
  final _address = "address";
  final _jwtToken = "jwt_token";
  final _status = "status";
  var preferences = BasePreferences.preferences;

  UserEntity getUser() {
    var user = UserEntity(
      id: preferences.getInt(_id) ?? 0,
      name: preferences.getString(_name) ?? "",
      dob: preferences.getString(_dob) ?? "",
      email: preferences.getString(_email) ?? "",
      phone: preferences.getString(_phone) ?? "",
      address: preferences.getString(_address) ?? "",
      gender: preferences.getString(_gender),
      status: preferences.getString(_status) ?? "",
    );
    return user;
  }

  void setUser(UserEntity user) {
    preferences.setInt(_id, user.id);
    preferences.setString(_name, user.name ?? "");
    preferences.setString(_dob, user.dob ?? "");
    preferences.setString(_email, user.email ?? "");
    preferences.setString(_phone, user.phone ?? "");
    preferences.setString(_address, user.address ?? "");
    preferences.setString(_gender, user.gender ?? "");
    preferences.setString(_status, user.status ?? "");
  }

  String? getToken() {
    return preferences.getString(_jwtToken);
  }

  void setToken(String token) async {
    preferences.setString(_jwtToken, token);
  }

  void logout() {
    preferences.clear();
  }
}
