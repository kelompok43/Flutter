import 'package:fitness_gym/models/preferences/user_preferences.dart';
import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex =>_selectedIndex;
  void update(int index){
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
}
