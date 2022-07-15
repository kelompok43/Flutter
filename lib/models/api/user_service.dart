import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Dio dio = Dio();
  Future postLogin(String email, String password) async {
    final _response = await dio.post(baseUrl + "user/login",
        data: {'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future postRegister(String name, String email, String password) async {
    final _response = await dio.post(baseUrl + "user/register",
        data: {'name': name, 'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Register Gagal");
    }
  }

  Future getDataById() async {
    final id = UserPreferences().getUser().id;
    final token = UserPreferences().getToken();

    final _response = await dio.get(
      baseUrl + "user/$id",
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    if (_response.statusCode! >= 200 || _response.statusCode! <= 300) {
      return _response.data;
    } else {
      throw Exception("Gagal Fetching Data");
    }
  }

  Future editDetailProfile(File file, String name, String dob, String address,
      String email, String phone, String token, int userId) async {
    var body = FormData.fromMap({
      'picture': await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
      'name': name,
      'dob': dob,
      'address': address,
      'email': email,
      'phone': phone
    });

    var response = await Dio().post(
      baseUrl + "user/detail/$userId",
      data: body,
      options: Options(
        headers: {
          "authorization": "Bearer $token",
        },
      ),
    );

    return response;
  }

  Future changePassword(String password) async {
    final id = UserPreferences().getUser().id;
    final response = await dio.put(baseUrl + "user/$id/change-password",
        data: {'password': password});
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Gagal Ubah Password");
    }
  }
}
