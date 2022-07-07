import 'package:dio/dio.dart';
import 'package:fitness_gym/models/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Dio dio = Dio();
  // dio.options.headers["Authorization"] = "Bearer ${token}";

  final _baseUrl = "https://api.gms.mirfanrafif.me/";
  Future postLogin(String email, String password) async {
    final _response = await dio.post(_baseUrl + "user/login",
        data: {'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Gagal Login");
    }
  }

  Future postRegister(String name, String email, String password) async {
    final _response = await dio.post(_baseUrl + "user/register",
        data: {'name': name, 'email': email, 'password': password});
    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception("Register Gagal");
    }
  }

  Future getDataByEmail(String email) async {
    final _response = await dio.get(_baseUrl + "user/get-email?email=$email");
    if (_response.statusCode! >= 200 || _response.statusCode! <= 300) {
      return _response.data;
    } else {
      throw Exception("Gagal Fetching Data");
    }
  }

  Future fetchDataByEmail() async {
    final sharedPref = await SharedPreferences.getInstance();
    final email = sharedPref.getString('email');
    final _response = await dio.get(_baseUrl + "user/get-email?email=$email");
    if (_response.statusCode! >= 200 || _response.statusCode! <= 300) {
      return _response.data;
    } else {
      throw Exception("Gagal Fetching Data");
    }
  }

  Future<UsersModel> fetchDataById() async {
    final responseId = await fetchDataByEmail();
    int id = responseId['data']['id'];
    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString('token');
    final _response = await dio.get(
      _baseUrl + "user/$id}",
      options: Options(
        headers: {"authorization": "Bearer $token"},
        contentType: "application/json"
      ),
    );
    if (_response.statusCode! >= 200 || _response.statusCode! <= 300) {
      return UsersModel.fromJson(_response.data);
    } else {
      throw Exception("Gagal Fetching Data");
    }
  }

  Future getDataById(int id, String token) async {
    final _response = await dio.get(
      _baseUrl + "user/$id",
      options: Options(headers: {"authorization": "Bearer $token"}),
    );
    if (_response.statusCode! >= 200 || _response.statusCode! <= 300) {
      return _response.data;
    } else {
      throw Exception("Gagal Fetching Data");
    }
  }
}
