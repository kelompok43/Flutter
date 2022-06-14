import 'package:fitness_gym/screens/login/login_screen.dart';
import 'package:fitness_gym/screens/register/register_screen.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/welcome_screen.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: Text(
                            "LOG IN",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primary5,
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight(15),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.poppins(
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        style: ElevatedButton.styleFrom(primary: neutral9),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
