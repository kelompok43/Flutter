import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  final user = UserPreferences().getUser();
}