import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunViewModel extends ChangeNotifier {
  void logout(BuildContext context) async {
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
