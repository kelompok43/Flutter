import 'package:dio/dio.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:flutter/material.dart';

import '../../models/api/user_service.dart';
import '../dashboard/dashboard_screen.dart';
import '../welcome/welcome_screen.dart';

class SplashViewModel extends ChangeNotifier {
  Future getDataUser(BuildContext context) async {
    try {
      await UserApi().getDataById();
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
