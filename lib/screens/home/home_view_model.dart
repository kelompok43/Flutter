import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  var user = UserPreferences().getUser();
  void getData() {
    user = UserPreferences().getUser();
  }
}