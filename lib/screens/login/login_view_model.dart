import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_api.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  var loginData = '';
  bool _isHidden = true;
  var url = "http://54.227.80.34/api/login/";
  bool get isHidden => _isHidden;
  set isHidden(bool newValue) {
    _isHidden = newValue;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    try {
      Map<String, dynamic> loginUser =
          await UserApi().postLogin(email, password);
      String _token = loginUser['data']['token'];
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString('token', _token);
      print(_token);
      const snackBar = SnackBar(
        content: Text('Login Berhasil'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
          (route) => false);
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        const snackBar = SnackBar(
          content: Text('Login Gagal'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }
}
