import 'package:dio/dio.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:flutter/material.dart';

import '../../models/api/user_service.dart';
import '../../models/entities/user_entity.dart';
import '../../models/responses/login_response.dart';
import '../welcome/welcome_screen.dart';

class HomeViewModel extends ChangeNotifier {
  var user = UserPreferences().getUser();

  get primary5 => null;
  void getData() {
    user = UserPreferences().getUser();
  }

  Future getDataUser(BuildContext context) async {
    try {
      await UserApi().getDataById();
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
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary5,
        duration: const Duration(seconds: 2),
        content: Text(e.response!.data['message']),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
