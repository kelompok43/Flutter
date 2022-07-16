import 'package:dio/dio.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../../models/api/user_service.dart';
import '../../utils/constants.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  bool _newPassHidden = true;
  bool get newPassHidden => _newPassHidden;
  set newPassHidden(bool newValue) {
    _newPassHidden = newValue;
    notifyListeners();
  }

  bool _confirmNewPassHidden = true;
  bool get confirmNewPassHidden => _confirmNewPassHidden;
  set confirmNewPassHidden(bool newValue) {
    _confirmNewPassHidden = newValue;
    notifyListeners();
  }

  void changePassword(String password, BuildContext context) async {
    try {
      await UserApi().changePassword(password);
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary5,
        duration: const Duration(seconds: 2),
        content: const Text("Ubah Password Berhasil"),
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on DioError catch (e) {
      if (e.response!.statusCode != 200) {
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: const Text("Ubah Password Gagal"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
