import 'package:dio/dio.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/api/user_api.dart';
import '../../models/users_model.dart';
import '../welcome/welcome_screen.dart';

class SplashViewModel extends ChangeNotifier {
  late UsersModel model;
  late Future<UsersModel> fetchUsers;
  Future getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');
    if (token != null && token.isNotEmpty) {
      return token;
    }
    return token;
  }

  Future getDataUser(BuildContext context) async {
    var sharedPref = await SharedPreferences.getInstance();
    final email = sharedPref.getString('email');
    final token = sharedPref.getString('token');
    print(token);
    try {
      Map<String, dynamic> getDataUser =
          await UserApi().getDataByEmail(email.toString());
      int id = getDataUser['data']['id'];
      print(id);
      try {
        final data = await UserApi().getDataById(id, token.toString());
        print(data);
        // model = UsersModel.fromJson(data['data']);
        if (token != null || token!.isNotEmpty) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
              (route) => false);
        }
        return token;
      } on DioError catch (e) {
        print(e.response!.statusCode);
        if (e.response!.statusCode != 200) {
          sharedPref.clear();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              ),
              (route) => false);
        }
      } catch (e) {
        print(e);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode != 200) {
        sharedPref.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
            (route) => false);
      }
    } catch (e) {
      print(e);
    }
  }
}
