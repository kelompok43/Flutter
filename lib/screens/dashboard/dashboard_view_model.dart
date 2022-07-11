import 'package:dio/dio.dart';
import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/api/user_service.dart';
import '../../models/entities/user_entity.dart';
import '../../models/responses/login_response.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void update(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void logout(BuildContext context) async {
    UserPreferences().logout();
    _selectedIndex = 0;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
        (route) => false);
  }

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
        status: response.data?.status ?? "",
        picture: response.data?.picture ?? "",
      ));
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
    }
  }
}
