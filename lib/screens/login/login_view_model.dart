import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_service.dart';
import 'package:fitness_gym/models/entities/user_entity.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/models/responses/api_error_response.dart';
import 'package:fitness_gym/models/responses/login_response.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isHidden = true;
  bool get isHidden => _isHidden;
  set isHidden(bool newValue) {
    _isHidden = newValue;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    try {
      Map<String, dynamic> loginUser =
          await UserApi().postLogin(email, password);

      var response = LoginResponse.fromJson(loginUser);

      UserPreferences().setUser(UserEntity(
          id: response.data?.id ?? 0,
          name: response.data?.name ?? "",
          dob: response.data?.dob ?? "",
          email: response.data?.email ?? "",
          phone: response.data?.phone ?? "",
          address: response.data?.address ?? "",
          gender: response.data?.gender ?? "",
          status: response.data?.status ?? "",
          picture: response.data?.picture ?? ""));

      UserPreferences().setToken(response.token ?? "");

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
      if (e.response?.data != null) {
        var errorResponse = ApiErrorResponse.fromJson(e.response!.data);
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: Text(errorResponse.message ?? ""),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      throw Exception("Gagal Login");
    }
  }
}
