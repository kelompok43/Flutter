import 'package:dio/dio.dart';
import 'package:fitness_gym/utils/constants.dart';

class UserApi {
  Future postLogin(String email, String password) async {
    final _response = await Dio().post(baseUrl + "user/login",
        data: {'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future postRegister(String name, String email, String password) async {
    final _response = await Dio().post(baseUrl + "user/register",
        data: {'name': name, 'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Register Gagal");
    }
  }
}
