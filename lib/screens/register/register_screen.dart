import 'package:fitness_gym/screens/register/register_view_model.dart';
import 'package:fitness_gym/screens/terms_n_conditions/terms_n_conditions.dart';
import 'package:fitness_gym/utils/constants.dart';
import 'package:fitness_gym/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _namaCtrl = TextEditingController();
    final _emailCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();
    final _confirmPasswordCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: neutral8,
        shadowColor: Colors.black12,
        title: Text(
          "Daftar",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: neutral9,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Consumer<RegisterViewModel>(
              builder: (BuildContext context, viewModel, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxHeight(20),
                    labelText("Nama Lengkap"),
                    sizedBoxHeight(5),
                    textFormField(
                        textCtrl: _namaCtrl,
                        hintText: "Masukkan Nama",
                        message: "Nama",
                        action: TextInputAction.next),
                    sizedBoxHeight(20),
                    labelText("Email atau Nomor Ponsel"),
                    sizedBoxHeight(5),
                    textFormField(
                      textCtrl: _emailCtrl,
                      hintText: "Masukkan Email atau No Ponsel",
                      message: "Email atau No Ponsel",
                      action: TextInputAction.next,
                    ),
                    sizedBoxHeight(20),
                    labelText("Kata Sandi"),
                    sizedBoxHeight(5),
                    textFormFieldForPassword(
                      textCtrl: _passwordCtrl,
                      hintText: "Masukkan Kata Sandi",
                      isHidden: viewModel.passIsHidden,
                      onTap: () {
                        viewModel.passIsHidden = !viewModel.passIsHidden;
                      },
                      message: "Kata Sandi",
                      action: TextInputAction.next,
                    ),
                    sizedBoxHeight(20),
                    labelText("Masukkan Ulang Kata Sandi"),
                    sizedBoxHeight(5),
                    textFormFieldForPassword(
                      textCtrl: _confirmPasswordCtrl,
                      hintText: "Masukkan Kata Sandi",
                      isHidden: viewModel.confirmPassIsHidden,
                      onTap: () {
                        viewModel.confirmPassIsHidden =
                            !viewModel.confirmPassIsHidden;
                      },
                      message: "Kata Sandi",
                      action: TextInputAction.done,
                    ),
                    sizedBoxHeight(20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            if (_passwordCtrl.text !=
                                _confirmPasswordCtrl.text) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const AlertDialog(
                                  title: Text("Confirm Password Tidak Sama"),
                                ),
                              );
                            } else {
                              viewModel.register(_namaCtrl.text,
                                  _emailCtrl.text, _passwordCtrl.text, context);
                            }
                          }
                        },
                        child: Text(
                          "Daftar",
                          style: GoogleFonts.poppins(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: primary4,
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
                                        color: info7),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TermsAndConditionsScreen(),
                                          ));
                                    }),
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
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TermsAndConditionsScreen(),
                                          ));
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
