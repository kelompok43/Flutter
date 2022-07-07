import 'package:dio/dio.dart';
import 'package:fitness_gym/models/users_model.dart';
import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/api/user_api.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  late Future<UsersModel> model;
  void update(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void logout(BuildContext context) async {
    _selectedIndex = 0;
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
        (route) => false);
  }

  // Future getData() async {
  //   var sharedPref = await SharedPreferences.getInstance();
  //   final email = sharedPref.getString('email');
  //   final token = sharedPref.getString('token');
  //   Map<String, dynamic> getDataUser =
  //       await UserApi().getDataByEmail(email.toString());
  //   int id = getDataUser['data']['id'];
  //   final response = await UserApi().getDataById(id, token.toString());
  //   print(response);
  // }

  // Future getDataUser(BuildContext context) async {
  //   var sharedPref = await SharedPreferences.getInstance();
  //   final email = sharedPref.getString('email');
  //   final token = sharedPref.getString('token');
  //   try {
  //     Map<String, dynamic> getDataUser =
  //         await UserApi().getDataByEmail(email.toString());
  //     int id = getDataUser['data']['id'];
  //     try {
  //       final data = await UserApi().getDataById(id, token.toString());
  //       model = UsersModel.fromJson(data['data']);
  //     } on DioError catch (e) {
  //       if (e.response!.statusCode != 200) {}
  //     } catch (e) {
  //       print(e);
  //     }
  //   } on DioError catch (e) {
  //     if (e.response!.statusCode != 200) {
  //       sharedPref.clear();
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const WelcomeScreen(),
  //           ),
  //           (route) => false);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
