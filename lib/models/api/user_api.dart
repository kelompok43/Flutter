import 'package:dio/dio.dart';

class UserApi {
  final _baseUrl = "http://54.227.80.34/api/";
  Future postLogin(String email, String password) async {
    final _response = await Dio().post(_baseUrl + "login/",
        data: {'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Gagal Login");
    }
  }
}
