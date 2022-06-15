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
    _selectedIndex = 0;
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove("token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
        (route) => false);
  }
}
