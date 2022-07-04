import 'package:dio/dio.dart';

class UserApi {
  final _baseUrl = "https://api.gms.mirfanrafif.me/";
  Future postLogin(String email, String password) async {
    final _response = await Dio().post(_baseUrl + "user/login",
        data: {'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future postRegister(String name, String email, String password) async {
    final _response = await Dio().post(_baseUrl + "user/register",
        data: {'name': name, 'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Register Gagal");
    }
  }
}
