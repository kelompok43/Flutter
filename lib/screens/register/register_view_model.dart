import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_api.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterViewModel extends ChangeNotifier{
  bool _passIsHidden = true;
  bool get passIsHidden => _passIsHidden;
  set passIsHidden(bool newValue) {
    _passIsHidden = newValue;
    notifyListeners();
  }
  bool _confirmPassIsHidden = true;
  bool get confirmPassIsHidden => _confirmPassIsHidden;
  set confirmPassIsHidden(bool newValue) {
    _confirmPassIsHidden = newValue;
    notifyListeners();
  }
  void login(String email, String password, BuildContext context) async {
    try {
      Map<String, dynamic> loginUser =
          await UserApi().postLogin(email, password);
      String _token = loginUser['data']['token'];
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString('token', _token);
      print(sharedPref.getString("token"));
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary5,
        duration: const Duration(seconds: 2),
        content: const Text('Login Berhasil'),
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
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: const Text('Login Gagal'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }
}