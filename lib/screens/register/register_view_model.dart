import 'package:dio/dio.dart';
import 'package:fitness_gym/models/api/user_service.dart';
import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _passIsHidden = true;
  bool get passIsHidden => _passIsHidden;
  set passIsHidden(bool newValue) {
    _passIsHidden = newValue;
    notifyListeners();
  }

  bool _confirmPassIsHidden = true;
  bool get confirmPassIsHidden => _confirmPassIsHidden;
  set confirmPassIsHidden(bool newValue) {
    _confirmPassIsHidden = newValue;
    notifyListeners();
  }

  void register(
      String name, String email, String password, BuildContext context) async {
    try {
      await UserApi().postRegister(name, email, password);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            "Register Berhasil",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: neutral9,
            ),
          ),
          titlePadding: const EdgeInsets.only(
            left: 70,
            top: 10,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: Text(
                  "Kembali Ke Halaman Awal",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: primary4,
                ),
              ),
            ),
          ],
        ),
      );
    } on DioError catch (e) {
      if (e.response!.statusCode != 200) {
        SnackBar snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: primary5,
          duration: const Duration(seconds: 2),
          content: Text(e.response!.data['message']),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      throw Exception("Gagal Login");
    }
  }
}
