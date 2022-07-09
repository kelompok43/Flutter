import 'package:dio/dio.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:flutter/material.dart';

import '../../models/api/user_service.dart';
import '../../models/entities/user_entity.dart';
import '../../models/responses/login_response.dart';
import '../dashboard/dashboard_screen.dart';
import '../welcome/welcome_screen.dart';

class SplashViewModel extends ChangeNotifier {
  Future getDataUser(BuildContext context) async {
    try {
      Map<String, dynamic> getDataUser = await UserApi().getDataById();
      var response = LoginResponse.fromJson(getDataUser);
      UserPreferences().setUser(UserEntity(
          id: response.data?.id ?? 0,
          name: response.data?.name ?? "",
          dob: response.data?.dob ?? "",
          email: response.data?.email ?? "",
          phone: response.data?.phone ?? "",
          address: response.data?.address ?? "",
          gender: response.data?.gender ?? "",
          status: response.data?.status ?? ""));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
          (route) => false);
    } on DioError catch (e) {
      if (e.response!.statusCode != 200) {
        UserPreferences().logout();
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
