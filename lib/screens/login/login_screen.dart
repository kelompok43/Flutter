import 'package:fitness_gym/screens/login/login_view_model.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: neutral8,
        shadowColor: Colors.black12,
        title: Text(
          "Login",
          style: TextStyle(
            color: neutral9,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Consumer<LoginViewModel>(
                  builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxHeight(20),
                    labelText("Email atau Nomor Ponsel"),
                    sizedBoxHeight(5),
                    textFormField(
                        textCtrl: _usernameController,
                        hintText: "Masukkan email",
                        message: "Email atau No Ponsel",
                        action: TextInputAction.next),
                    // sizedBoxHeight(5),
                    // exampleText('Contoh: 08123456789'),
                    sizedBoxHeight(20),
                    labelText("Password"),
                    sizedBoxHeight(5),
                    textFormFieldForPassword(
                        textCtrl: _passwordController,
                        hintText: "Masukkan Kata Sandi",
                        isHidden: viewModel.isHidden,
                        onTap: () {
                          viewModel.isHidden = !viewModel.isHidden;
                        },
                        message: "Kata Sandi",
                        action: TextInputAction.next),

                    // sizedBoxHeight(5),
                    // exampleText('Contoh: 08123456789'),
                    sizedBoxHeight(20),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            viewModel.login(_usernameController.text,
                                _passwordController.text, context);
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primary4),
                        ),
                      ),
                    ),
                    sizedBoxHeight(20),
                    Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Dengan mendaftar, saya menyetujui ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 10,
                                  color: neutral4,
                                  fontWeight: FontWeight.bold),
                            ),
                            children: [
                              TextSpan(
                                  text: "Syarat dan Ketentuan ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: info7,
                                    ),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                text: "Serta ",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      color: neutral4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextSpan(
                                  text: "Kebijakan Privasi ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: info7),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          )),
    );
  }
}
