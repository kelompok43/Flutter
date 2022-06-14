import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_api.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  bool _passIsHidden = true;
  bool get passIsHidden => _passIsHidden;
  set passIsHidden(bool newValue) {
    _passIsHidden = newValue;
    notifyListeners();
  }

  
}